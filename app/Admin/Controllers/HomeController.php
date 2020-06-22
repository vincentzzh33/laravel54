<?php


namespace App\Admin\Controllers;


use Illuminate\Support\Facades\Mail;

class HomeController extends Controller
{

    public function index(){
        //Mail::raw('有新快递申请', function ($mes) {
        //    \Log::info('email');
        //    $mes->to(['huiliang.zhang@lexisnexis.com'])->subject('有新快递申请');
        //});
        return view('admin.home.index');
    }
}