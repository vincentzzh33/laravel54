<?php

namespace App\Providers;

use App\Model\Topic;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     * 服务提供者注册完之后
     * @return void
     */
    public function boot()
    {
        //mb4string 4个byte对应一个 767/4=191
        Schema::defaultStringLength('191');
        \View::composer('layout.siderbar',function($view){
           $view->with('topics',Topic::all());
        });
        \DB::listen(function ($query){
            $sql = $query->sql;
            $bindings = $query->bindings;
            $time = $query->time;//毫秒
            //if ($time>10)
            \Log::debug(var_export(compact('sql','bindings','time'),true));
        });
    }

    /**
     * Register any application services.
     * 服务提供者启动之前
     * @return void
     */
    public function register()
    {
        //
        if ($this->app->environment() !== 'production') {
            $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
        }
    }
}
