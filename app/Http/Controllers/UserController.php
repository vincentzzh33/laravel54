<?php


namespace App\Http\Controllers;


use App\Model\Fan;
use App\Model\User;

class UserController extends Controller
{

    public function setting() {

        return view('user.setting');
    }

    public function settingStore() {

    }

    public function show(User $user) {

        //这个文章的列表
        $user  = User::withCount(['stars', 'fans', 'posts'])->find($user->id);
        $posts = $user->posts()
            ->orderBy('created_at', 'desc')
            //->take(10)
            //->get();
            ->paginate(6);

        $fans   = $user->fans;
        $fusers = User::whereIn('id', $fans->pluck('fan_id'))
            ->withCount(['stars', 'fans', 'posts'])
            ->get();

        $stars  = $user->stars;
        $susers = User::whereIn('id', $stars->pluck('star_id'))
            ->withCount(['stars', 'fans', 'posts'])
            ->get();
        return view('user.show', compact('user', 'posts', 'fusers', 'susers'));
    }

    public function fan(User $user) {
        $me = \Auth::user();
        $me->doFan($user->id);
        return [
            'error' => 0,
            'msg'   => ''
        ];
    }

    public function unfan(User $user) {
        //$me = \Auth::user();
        //$me->doUnFan($user->id);
        Fan::where([
            'star_id' => $user->id,
            'fan_id'  => \Auth::id()
        ])->delete();
        return [
            'error' => 0,
            'msg'   => ''
        ];
    }
}