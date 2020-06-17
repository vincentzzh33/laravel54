<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Comment extends Base
{
    //
    public function post(){
        return $this->belongsTo(Post::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
