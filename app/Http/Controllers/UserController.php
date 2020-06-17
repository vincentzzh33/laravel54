<?php


namespace App\Http\Controllers;


class UserController extends Controller
{

    public function setting(){

        return view('user.setting');
    }

    public function settingStore(){

    }
}