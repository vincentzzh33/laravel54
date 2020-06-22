<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AdminRole extends Base
{
    //关联关系表不用创建model

    //当前角色的权限
    public function permissions(){
        return $this->belongsToMany(AdminPermission::class,'admin_permission_role','role_id','permission_id')->withPivot(['permission_id','role_id']);

    }

    //给角色赋予权限
    public function grantPermission($permission){
        return $this->permissions()->save($permission);
    }

    public function deletePermission($permission){
        return $this->permissions()->detach($permission);
    }

    public function hasPermission($permission){
        return $this->permissions->contains($permission);
    }
}
