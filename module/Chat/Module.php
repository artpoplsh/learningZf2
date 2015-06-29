<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Chat;

require_once '/var/www/zf2/module/Chat/model/Follows.php';
require_once '/var/www/zf2/module/Chat/model/FollowsTable.php';
require_once '/var/www/zf2/module/Chat/model/ChatMes.php';
require_once '/var/www/zf2/module/Chat/model/ChatMesTable.php';
use Chat\Model\ChatMes;
use Chat\Model\ChatMesTable;
use Chat\Model\Follows;
use Chat\Model\FollowsTable;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\ModuleManager\Feature\ConfigProviderInterface;
use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\ModuleManager\Feature\ServiceProviderInterface;


use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ServiceManager\ServiceLocatorInterface;

class Module implements ConfigProviderInterface,AutoloaderProviderInterface,
ServiceProviderInterface
{

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
    public function getServiceConfig(){
            return array(
                'factories' => array(
                'Chat\Model\FollowsTable' =>  function(ServiceLocatorInterface $sm) {
                        $tableGateway = $sm->get('FollowsTableGateway');
                        $table = new FollowsTable($tableGateway);

                    return $table;
                },
                'FollowsTableGateway' => function (ServiceLocatorInterface $sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                   $resultSetPrototype = new ResultSet();

                   $resultSetPrototype->setArrayObjectPrototype(new Follows());
                   return new TableGateway('follows', $dbAdapter, null, $resultSetPrototype);
                  },

                'Chat\Model\ChatMesTable' =>  function(ServiceLocatorInterface $sm) {
                        $tableGateway = $sm->get('ChatMesTableGateway');
                        $table = new ChatMesTable($tableGateway);

                        return $table;
                    },
                'ChatMesTableGateway' => function (ServiceLocatorInterface $sm) {
                        $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                        $resultSetPrototype = new ResultSet();

                        $resultSetPrototype->setArrayObjectPrototype(new ChatMes());
                        return new TableGateway('chatmes', $dbAdapter, null, $resultSetPrototype);
                    },
                  ),
           );
        }
        
    }

