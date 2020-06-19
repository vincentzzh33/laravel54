<?php

namespace App\Model;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable//启用auth类
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    //protected $hidden = [
    //    'password', 'remember_token',
    //];

    public function posts() {
        return $this->hasMany(Post::class, 'user_id', 'id');
    }

    //关注我的
    public function fans() {
        return $this->hasMany(Fan::class, 'star_id', 'id');
    }

    //我关注的
    public function stars() {
        return $this->hasMany(Fan::class, 'fan_id', 'id');
    }

    //关注
    public function doFan($uid) {
        $fan          = new Fan();
        $fan->star_id = $uid;
        return $this->stars()->save($fan);
    }

    public function doUnFan($uid) {
        $fan          = new Fan();
        $fan->star_id = $uid;
        $fan->fan_id = \Auth::id();
        return $fan->delete();
    }

    public function hasFan($uid) {
        return $this->fans()->where('fan_id', $uid)->count();
    }

    public function hasStar($uid) {
        return $this->stars()->where('star_id', $uid)->count();
    }
}
