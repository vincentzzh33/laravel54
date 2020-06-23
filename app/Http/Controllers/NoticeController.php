<?php


namespace App\Http\Controllers;


class NoticeController extends Controller
{

    public function index(){
        $user = \Auth::user();
        $notices = $user->notices;//非函数获取对象
        return view('notice.index',compact('notices'));
    }
}