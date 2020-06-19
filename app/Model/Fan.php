<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Fan extends Model
{
    //粉丝用户
    public function fuser(){
        return $this->hasOne(User::class,'id','fan_id');
    }


    public function suser(){
        return $this->hasOne(User::class,'id','star_id');
    }

}
