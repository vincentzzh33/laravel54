<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Post extends Base
{
    //当用create
    //protected $guarded = [];//不可以注入
    //protected $fillable = ['title', 'content'];//可以注入

    //关联用户
    public function user() {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function comments() {
        return $this->hasMany(Comment::class)
            ->orderBy('created_at', 'desc');
    }

    //一对一
    public function favor($user_id) {
        return $this->hasOne(Favor::class)
            ->where('user_id', $user_id);
    }

    public function favors(){
        return $this->hasMany(Favor::class);
    }
}
