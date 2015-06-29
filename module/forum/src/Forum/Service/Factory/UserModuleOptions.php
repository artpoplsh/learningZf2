<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/23
 * Time: 19:13
 */

namespace User\Service\Factory;


use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use User\Options\UserModuleOptions as UserModuleOptionsOptions;


class UserModuleOptions implements  FactoryInterface
{

    public function createService(ServiceLocatorInterface $serviceLocator){
        $config=$serviceLocator->get('config');
        $userConfig=isset($config[UserModuleOptionsOptions::CONFIG_KEY])?
                    $config[UserModuleOptionsOptions::CONFIG_KEY]:[];
        return new UserModuleOptionsOptions($userConfig);
    }

}