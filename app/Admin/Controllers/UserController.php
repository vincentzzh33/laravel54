<?php


namespace App\Admin\Controllers;


use App\Model\AdminUser;

class UserController extends Controller
{
    public function index() {
        $users = AdminUser::paginate(10);
        return view('admin.user.index', compact('users'));
    }

    public function create() {
        return view('admin.user.add');
    }

    public function store() {
        $this->validate(request(), [
            'name'     => 'required|min:3',
            'password' => 'required|min:3',
        ]);
        AdminUser::firstOrCreate([
            'name'     => request('name'),
            'password' => bcrypt(request('password')),
        ]);
        return redirect('admin/users');
    }

    public function role(){
        return view('admin.user.role');
    }

    public function storeRole(){

    }
}