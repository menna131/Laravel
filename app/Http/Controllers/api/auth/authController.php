<?php

namespace App\Http\Controllers\api\auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\QueryException;


class authController extends Controller
{
    public function register(Request $request)
    {
        $rules = [
            "name"=>'required|string|min:2',
            "email"=>'required|unique:users',
            'phone'=>'required|unique:users|digits:11',
            'password'=>'required|min:8',
        ];
        $validator = Validator::make($request->all(), $rules,[
            'name.required'=> 'd5al l esm',
            'phone.required' => 'lazm phone'
        ]);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }
        $data = $request->except('password');
        $data['password'] = bcrypt($request->password);
        // return $data;
        // User::create($request->all());
        // insert fl db && get l id...3shan n7oto fl token
        $id = User::insertGetId($data);
        // get all info from table of this user
        $user = User::find($id);
        // return data in the response
        // return response()->json($user, 200);

        // login finction from jwt documentation
        $credentials = $request->only('email', 'password');

        if (!$token = auth('api')->attempt($credentials)) {
            return response()->json(['message'=>'unauthorized'], 401);
        }
        $user->token = 'bearer'.' '.$token;
        return response()->json($user, 200);

    }

    public function checkCode(Request $request)
    {
        $rules = [
            'code' => 'required|digits:5|exists:users'
        ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }
        // return auth('api')->user(); //dh bygbli l user kolo

        // brg3 l info bta3t l user mnl db...lw l code hwa hwa wl id hwa hwa
        $check = User::where('code','=', $request->code)->where('id', '=', auth('api')->user()->id)->first();

        // check lw fh 7aga wala l2
        if($check){
            $user = User::find(auth('api')->user()->id);
            $user->status = 1;
            $user->save();
            $user->token = $request->header('authorization');
            // return $user;
            return response()->json($user, 200);
        }
        return response()->json(['message'=>'wrong code'], 403);
    }

    public function profile(Request $request)
    {
        $user = auth('api')->user();
        // $user->token = $request->header();
        return response()->json($user, 200);
    }

    public function login(Request $request)
    {
        $rules = [
            "email"=>'required',
            'password'=>'required|min:8',
        ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }
        
        $credentials = $request->all();

        if (!$token = auth('api')->attempt($credentials)) {
            return response()->json(['message'=>'unauthorized'], 401);
        }
        $user = auth('api')->user();
        if($user->status == 2){
            return response()->json(['message'=>'you must verify your account'], 401);
        }
        $user->token = 'bearer '.$token;
        return response()->json($user, 200);
    }


    public function sendCode(Request $request)
    {
        $user = Auth::guard('api')->user();
        $email = $user->email;
        $code = rand(10000, 99999);

        $updatedUser = User::find($user->id);
        $updatedUser->code = $code;
        $updatedUser->save();
        //send email

        $updatedUser->token = $request->header('authorization');
        return response()->json($updatedUser, 200);
    }

    public function logout(Request $request)
    {
        auth('api')->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }

    public function updateProfile(REquest $request)
    {
        $rules = [
            "name"=>'string|min:2',
            'phone'=>'digits:11',
        ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }

        $data = $request->all();
        // return $data;
        $user = auth('api')->user();
        // return $request->all();
        //try and catch one to catch the duplication in the sql
        try{
            // return $request->has('name');
            // return $request->all();
            $nnn = User::find($user->id);
            // return $nnn;
            User::where('id','=', $user->id)->update($request->all());
            
            if($request->has('name')){
                $user->name = $request->name;
                // return "ok";
            }  

            if($request->has('phone')){
                $user->phone = $request->phone;
            }
            // $user->name = $request->name;
            // $user->phone = $request->phone;
            $user->token = $request->header('authorization');
            // User::where('id', '=', $user->id)->update($);
            return $user;
            return response()->json($user, 200);
        }catch(QueryException $ex){
            $message = $ex->getMessage();
            // return $message;
            if(strpos($message, 'user_phone_unique') !== false){
                return response()->json(["message"=>"Phone already exists"], 403);
            }
            // else{
            //     return response()->json(["message"=>"mail already exists"], 403);// dh bs kona bngarab
            // }
        }

        // old method
        // $check = User::where('id', $user->id)->update($request->all());
        // if($check){
        //     if($request->has('name'))
        //         $user->name = $request->name;

        //     if($request->has('phone'))
        //         $user->phone = $request->phone;

        //     $user->token = $request->header('authorization');
        //     return response()->json($user, 200);
        // }else{
        //     return response()->json(["message"=>"something went wrong"], 400);
        // }
    }
}
