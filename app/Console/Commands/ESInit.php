<?php

namespace App\Console\Commands;

use GuzzleHttp\Client;
use Illuminate\Console\Command;

class ESInit extends Command
{
    /**
     * The name and signature of the console command.
     *
     * 这里是命令
     * @var string
     */
    protected $signature = 'es:init';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '初始化es';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle() {
        //1.创建template
        $client = new Client();
        $url = config('scout.elasticsearch.hosts')[0] . '/_template/tmp';
        try {
            $client->delete($url);
        } catch (\Exception $exception) {
            $this->info($exception->getMessage());
        }
        $param = [
            'json' => [
                'template' => config('scout.elasticsearch.index'),
                'mappings' => [
                    '_default_' => [
                        'dynamic_templates' => [
                            ['strings' => [
                                'match_mapping_type' => 'string',
                                'mapping'            => [
                                    'type'     => 'text',
                                    'analyzer' => 'ik_smart',
                                    'fields'   => [
                                        'keyword' => [
                                            'type' => 'keyword'
                                        ]
                                    ]
                                ]
                            ]
                            ]
                        ]
                    ]
                ]
            ]
        ];
        $client->put($url, $param);
        $this->info('created template success');


        //2.创建index
        $url = config('scout.elasticsearch.hosts')[0] . '/' . config('scout.elasticsearch.index');
        try {
            $client->delete($url);
        } catch (\Exception $exception) {
            $this->info($exception->getMessage());
        }
        $param = [
            'json' => [
                'settings' => [
                    'refresh_interval'   => '5s',
                    'number_of_shards'   => 1,
                    'number_of_replicas' => 0,
                ],
                'mappings' => [
                    '_default_' => [
                        '_all' => [
                            'enabled' => false
                        ]
                    ]
                ]
            ]
        ];
        $client->put($url, $param);
        $this->info('created index success');
    }
}
