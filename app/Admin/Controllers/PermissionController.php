<?php


namespace App\Admin\Controllers;


use Illuminate\Support\Facades\Mail;

class PermissionController extends Controller
{

    public function index(){
        return view('admin.permission.index');
    }

    public function create(){
        return view('admin.permission.create');
    }

    public function store(){
    }
}