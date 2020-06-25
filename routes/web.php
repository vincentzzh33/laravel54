<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/register', 'RegisterController@index');
Route::post('/register', 'RegisterController@register');
Route::get('/login', 'LoginController@index')->name('login');
Route::post('/login', 'LoginController@login');

Route::group(['middleware' => 'auth:web'], function () {
    Route::get('/', 'LoginController@index');
    Route::get('/logout', 'LoginController@logout');
    Route::get('/user/me/setting', 'UserController@setting');
    Route::post('/user/{user}/setting', 'UserController@settingStore');
    Route::get('/posts', 'PostController@index');//文章列表页
    Route::get('/posts/create', 'PostController@create');//创建文章
    Route::post('/posts', 'PostController@store');
    Route::get('/posts/search', 'PostController@search');//路由有先后顺序
    Route::get('/posts/{post}', 'PostController@show');//文章详情页
    Route::get('/posts/{post}/edit', 'PostController@edit');//编辑文章
    Route::put('/posts/{post}', 'PostController@update');
    Route::get('/posts/{post}/delete', 'PostController@delete');//删除
    Route::post('/posts/image/upload', 'PostController@imageUpload');//图片上传
    Route::post('/posts/{post}/comment', 'PostController@comment');//提交评论
    Route::get('/posts/{post}/favor', 'PostController@favor');
    Route::get('/posts/{post}/unfavor', 'PostController@unfavor');
    //个人中心
    Route::get('/user/{user}', 'UserController@show');
    Route::get('/user/{user}/setting', 'UserController@setting');
    Route::post('/user/{user}/fan', 'UserController@fan');
    Route::post('/user/{user}/unfan', 'UserController@unfan');
    //专题
    Route::get('/topic/{topic}', 'TopicController@show');
    Route::post('/topic/{topic}/submit', 'TopicController@submit');
    //通知
    Route::get('/notices','NoticeController@index');
});
