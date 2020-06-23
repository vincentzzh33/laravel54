<?php


namespace App\Admin\Controllers;


use App\Jobs\SendMessage;
use App\Model\Notice;

class NoticeController extends Controller
{

    public function index() {
        $notices = Notice::paginate(10);
        return view('admin.notice.index', compact('notices'));
    }

    public function create() {
        return view('admin.notice.create');
    }

    public function store() {
        $this->validate(request(), [
            'title'   => 'required|string',
            'content' => 'required|string',
        ]);
        $notice = Notice::create(request(['title', 'content']));

        dispatch(new SendMessage($notice));

        return redirect('/admin/notices');
    }
}