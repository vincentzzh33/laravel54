<?php

namespace App\Http\Controllers;

use App\Model\Comment;
use App\Model\Favor;
use App\Model\Post;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    //列表页
    public function index(Request $request) {
        $app = app();
        $log = $app->make('log');
        $log->info('come');

        $posts = Post::orderBy('created_at', 'desc')
            ->withCount(['comments','favors'])
            ->paginate(6);
        return view('post/index', compact('posts'));
    }

    public function show(Post $post) {
        $post->load('comments');//预加载
        return view('post/show', compact('post'));

    }

    public function create() {
        return view('post/create');
    }

    public function store() {
        $this->validate(request(), [
            'title'   => 'required|string|max:100|min:5',
            'content' => 'required|string|min:5'
        ], [
            //'title.min'=>'文章标题过短'
        ]);
        $user_id = Auth::id();
        $post    = Post::create(array_merge(request(['title', 'content']), compact('user_id')));
        //dd($post);
        return redirect('/posts');
    }


    public function edit(Post $post) {
        return view('post/edit', compact('post'));

    }

    public function update(Post $post) {
        $this->validate(request(), [
            'title'   => 'required|string|max:100|min:5',
            'content' => 'required|string|min:5'
        ]);

        try {
            $this->authorize('update', $post);
        } catch (AuthorizationException $e) {
            return back()->withErrors('no auth');
        }
        $post->title   = request('title');
        $post->content = request('content');
        $post->save();
        return redirect('/posts/' . $post->id);
    }

    public function delete(Post $post) {
        //todo 用户权限认证
        try {
            $this->authorize('delete', $post);
        } catch (AuthorizationException $e) {
            return back()->withErrors('no auth');
        }

        try {
            $post->delete();
        } catch (\Exception $e) {
            \Log::error($e->getMessage());
        }
        return redirect('/posts');
    }

    public function imageUpload(Request $request) {
        $path = $request->file('wangEditorH5File')->storePublicly(md5(time()));
        return asset('storage/' . $path);
    }

    public function comment(Post $post) {

        $this->validate(request(), [
            'content' => 'required|min:3'
        ]);
        $comment          = new Comment();
        $comment->user_id = Auth::id();
        $comment->content = request('content');
        $post->comments()->save($comment);

        return back();
    }

    public function favor(Post $post) {
        //$favor = new Favor();
        //$favor->user_id = Auth::id();
        //$post->favors()->save($favor);
        $res = Favor::firstOrCreate([
            'user_id' => Auth::id(),
            'post_id' => $post->id,
        ]);
        return back();
    }

    public function unfavor(Post $post) {
        $post->favor(Auth::id())->delete();
        return back();
    }

    public function search(){
        //1.验证
        $this->validate(\request(),[
            'query'=>'required'
        ]);
        //2.逻辑
        $query = \request('query');
        $posts = Post::search($query)->paginate(6);

        //3.渲染

        return view('post.search',compact('posts','query'));
    }
}
