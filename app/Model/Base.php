<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Base extends Model
{
    //当用create
    protected $guarded = [];//不可以注入
    //protected $fillable = ['title', 'content'];//可以注入
}
