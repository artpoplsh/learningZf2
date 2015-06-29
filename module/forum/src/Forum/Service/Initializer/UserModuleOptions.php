<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/23
 * Time: 23:46
 */

namespace User\Service\Initializer;


use User\Options\UserModuleOptionsAwareInterface;
use Zend\ServiceManager\InitializerInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class UserModuleOptions implements InitializerInterface{
    public function initialize($instance, ServiceLocatorInterface $serviceLocator)
    {
        $userModuleOptions=$serviceLocator->getServiceLocator()->get('UserModuleOptions');
         if($instance instanceof UserModuleOptionsAwareInterface){
             $instance->setUserModuleOptions($userModuleOptions);
    }
    }

}