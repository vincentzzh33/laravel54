<?php

namespace App\Http\Controllers;

use App\Model\Post;
use App\Model\PostTopic;
use App\Model\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    public function show(Topic $topic) {
        //带文章数的专题
        $topic = Topic::withCount('postTopics')->find($topic->id);

        //专题的文章列表,按时间倒序
        $posts = $topic->posts()->orderBy('created_at', 'desc')->paginate(6);

        //未投稿
        $myposts = Post::authorBy(\Auth::id())->topicNotBY($topic->id)->get();
        return view('topic.show', compact('topic', 'posts', 'myposts'));
    }

    public function submit(Topic $topic) {
        $this->validate(\request(), [
            'post_ids' => 'required|array'
        ]);
        $post_ids = \request('post_ids');
        $topic_id = $topic->id;
        foreach ($post_ids as $post_id) {
            PostTopic::firstOrCreate(compact('topic_id', 'post_id'));
        }
        return back();
    }
}
