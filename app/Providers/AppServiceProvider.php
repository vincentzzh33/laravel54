<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     * 服务提供者启动之后
     * @return void
     */
    public function boot()
    {
        //mb4string 4个byte对应一个 767/4=191
        Schema::defaultStringLength('191');
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
