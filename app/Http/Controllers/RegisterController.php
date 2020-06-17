<?php


namespace App\Http\Controllers;


use App\Model\User;

class RegisterController extends Controller
{

    //注册页
    public function index() {
        return view('register.index');
    }

    public function register() {

        $this->validate(request(), [
            'name'     => 'required|min:3|unique:users,name',//unique 表名字段名
            'email'    => 'required|unique:users,email|email',
            'password' => 'required|min:5|max:10|confirmed'
        ]);

        $name     = request('name');
        $email    = request('email');
        $password = bcrypt(request('password'));
        $user     = User::create(compact('name', 'email', 'password'));

        return redirect('/login');
    }


}