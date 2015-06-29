<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/6
 * Time: 20:46
 */
namespace Base\Service\Initializers;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\ServiceManager\InitializerInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class Db implements InitializerInterface{
    public function initialize($instance, ServiceLocatorInterface $serviceLocator){
        if($instance instanceof AdapterAwareInterface){
            $instance->setDbAdapter($serviceLocator->get('Zend\Db\Adapter\Adapter'));
        }
    }

}