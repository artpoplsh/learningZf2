<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/2
 * Time: 23:08
 */
namespace Forum;
use Forum\Model\Post;
use Forum\Model\PostTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Class Module
 * @package Forum
 */
class Module{
    /**
     * @return mixed
     */
    public function getConfig(){
        return include __DIR__.'/config/module.config.php';
    }

    /**
     * @return array
     */
    public function getAutoloaderConfig(){
        return [
            'Zend\Loader\StandardAutoloader' => [
                'namespaces' => [
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ],
            ],
        ];
    }

    /**
     * @return array
     */
    public function getServiceConfig(){
        return array(
            'factories' => array(
                'Post\Table\PostTable' =>  function(ServiceLocatorInterface $sm) {
                    $tableGateway = $sm->get('PostTableGateway');
                    $table = new PostTable($tableGateway);
                    return $table;
                },
                'PostTableGateway' => function (ServiceLocatorInterface $sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();

                    $resultSetPrototype->setArrayObjectPrototype(new Post());
                    return new TableGateway('post', $dbAdapter, null, $resultSetPrototype);
                },
            ),
        );
    }

}