<?php


namespace App\Admin\Controllers;


use Illuminate\Support\Facades\Mail;

class RoleController extends Controller
{

    public function index() {
        return view('admin.role.index');
    }

    public function create() {
        return view('admin.role.create');
    }

    public function store() {
        return view('admin.home.index');
    }

    public function permission() {
        return view('admin.role.permission');
    }

    public function storePermission() {
        return view('admin.home.index');
    }
}