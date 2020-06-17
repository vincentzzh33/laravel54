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


Route::get('/', 'PostController@index');

Route::get('/register', 'RegisterController@index');
Route::post('/register', 'RegisterController@register');
Route::get('/login', 'LoginController@index');
Route::post('/login', 'LoginController@login');
Route::get('/logout', 'LoginController@logout');
Route::get('/user/me/setting', 'UserController@setting');
Route::post('/user/me/setting', 'UserController@settingStore');

Route::get('/posts', 'PostController@index');//文章列表页
Route::get('/posts/create', 'PostController@create');//创建文章
Route::post('/posts', 'PostController@store');
Route::get('/posts/{post}', 'PostController@show');//文章详情页
Route::get('/posts/{post}/edit', 'PostController@edit');//编辑文章
Route::put('/posts/{post}', 'PostController@update');
Route::get('/posts/{post}/delete', 'PostController@delete');//删除
Route::post('/posts/image/upload', 'PostController@imageUpload');//图片上传
Route::post('/posts/{post}/comment','PostController@comment');//提交评论
Route::get('/posts/{post}/favor','PostController@favor');
Route::get('/posts/{post}/unfavor','PostController@unfavor');