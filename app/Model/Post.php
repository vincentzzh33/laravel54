<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Post extends Base
{
    use Searchable;

    //定义索引里面的type
    public function searchableAs() {
        return 'post';
    }

    public function toSearchableArray() {
        return [
            'title'   => $this->title,
            'content' => $this->content
        ];
    }

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

    public function favors() {
        return $this->hasMany(Favor::class);
    }

    //属于某个作者的文章
    public function scopeAuthorBy(Builder $query, $user_id) {
        return $query->where('user_id', $user_id);
    }

    public function postTopics() {
        return $this->hasMany(PostTopic::class, 'post_id', 'id');
    }

    public function scopeTopicNotBy(Builder $query, $topic_id) {
        return $query->doesntHave('postTopics', 'and', function ($q) use ($topic_id) {
            $q->where('topic_id', $topic_id);
        });
    }

    //全局scope的方式
    protected static function boot(){
        parent::boot();
        static::addGlobalScope("available",function (Builder $builder){
            $builder->whereIn('status',[0,1]);
        });
    }
}
