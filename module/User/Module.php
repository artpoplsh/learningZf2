<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 20:31
 */
namespace User;

use User\Table\User;
use User\Table\UserMessage;
use User\Table\UserMessageTable;
use User\Table\UserTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\DependencyIndicatorInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class Module implements ConfigProviderInterface,AutoloaderProviderInterface,
    DependencyIndicatorInterface
{
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
    public function getModuleDependencies(){
        return[
            'Base'
        ];
    }
    public function getServiceConfig(){
        return array(
            'factories' => array(
                'User\Table\UserTable' =>  function(ServiceLocatorInterface $sm) {
                    $tableGateway = $sm->get('UserTableGateway');
                    $table = new UserTable($tableGateway);
                    return $table;
                },
                'UserTableGateway' => function (ServiceLocatorInterface $sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();

                    $resultSetPrototype->setArrayObjectPrototype(new User());
                    return new TableGateway('user', $dbAdapter, null, $resultSetPrototype);
                },


                'User\Table\UserMessageTable' =>  function(ServiceLocatorInterface $sm) {
                    $tableGateway = $sm->get('UserMessageTableGateway');
                    $table = new UserMessageTable($tableGateway);
                    return $table;
                },
                'UserMessageTableGateway' => function (ServiceLocatorInterface $sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();

                    $resultSetPrototype->setArrayObjectPrototype(new UserMessage());

                    return new TableGateway('userMessage', $dbAdapter, null, $resultSetPrototype);
                },
            ),
        );
    }

}