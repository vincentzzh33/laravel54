<?php


Route::get('/login', 'LoginController@index')->name('admin_login');
Route::post('/login', 'LoginController@login');
Route::get('/logout', 'LoginController@logout');

Route::group(['middleware' => 'auth:admin'], function () {
    Route::get('/home', 'HomeController@index');
    //管理人员
    Route::get('/users', 'UserController@index');
    Route::get('/users/create', 'UserController@create');
    Route::post('/users/store', 'UserController@store');
    Route::get('/users/{user}/role', 'UserController@role');
    Route::post('/users/{user}/role', 'UserController@storeRole');
    //角色
    Route::get('/roles', 'RoleController@index');
    Route::get('/roles/create', 'RoleController@create');
    Route::post('/roles/store', 'RoleController@store');
    Route::get('/roles/{role}/permission', 'RoleController@permission');
    Route::post('/roles/{role}/permission', 'RoleController@storePermission');
    //权限
    Route::get('/permissions', 'PermissionController@index');
    Route::get('/permissions/create', 'PermissionController@create');
    Route::post('/roles/store', 'PermissionController@store');

    //审核
    Route::get('/posts', 'PostController@index');
    Route::post('/posts/{post}/status', 'PostController@status');
    //专题
    Route::get('/topic/{topic}/del', 'TopicController@del');
    Route::resource('topics', 'TopicController', ['only' => ['index', 'create', 'store', 'destroy']]);
});
