<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 20:50
 */
namespace Base;
class Module{
    public function getConfig(){
        return include __DIR__.'/config/module.config.php';
    }

    public function getAutoloaderConfig(){
        return [
            'Zend\Loader\StandardAutoloader' => [
                'namespaces' => [
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ],
            ],
        ];
    }
}