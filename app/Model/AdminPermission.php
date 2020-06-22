<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AdminPermission extends Base
{
    public function roles(){
        return $this->belongsToMany(AdminRole::class,'admin_permission_role','permission_id','role_id')->withPivot(['permission_id','role_id']);
    }
}
