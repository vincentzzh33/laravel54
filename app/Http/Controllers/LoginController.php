<?php


namespace App\Http\Controllers;


use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{

    public function index() {
        if (Auth::id()){
            return redirect('/posts');
        }
        return view('login.index');
    }

    public function login() {

        $this->validate(request(), [
            'email'       => 'required|email',
            'password'    => 'required|min:5|max:10',
            'is_remember' => 'integer'
        ]);
        $user = request(['email','password']);
        $is_remember = boolval(request('is_remember'));
        if (Auth::attempt($user,$is_remember)){
            return redirect('/posts');
        }

        return back()->withErrors('邮箱密码不匹配');
    }

    public function logout() {
        Auth::logout();
        return redirect('/login');
    }
}