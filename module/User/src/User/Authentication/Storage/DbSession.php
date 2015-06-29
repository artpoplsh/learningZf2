<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/6
 * Time: 19:07
 */

namespace User\Authentication\Storage;



use Zend\Authentication\Storage\StorageInterface;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\TableGateway\TableGateway;
use Zend\ServiceManager\ServiceManager;
use Zend\Session\Container;
use Zend\Session\SaveHandler\DbTableGateway;
use Zend\Session\SaveHandler\DbTableGatewayOptions;
use Zend\Session\SessionManager;

class DbSession implements StorageInterface,AdapterAwareInterface{
    protected $table='user_session';
    protected $adapter;
    public function __construct($namespace = null, $member = null, SessionManager $manager = null)
    {
        if ($namespace !== null) {
            $this->namespace = $namespace;
        }
        if ($member !== null) {
            $this->member = $member;
        }
        $this->session   = new Container($this->namespace, $manager);

        $tableGateway=new TableGateway($this->table,$this->adapter);
        $dbTableGatewayOptions= new DbTableGatewayOptions();
        $dbTableGateway=new DbTableGateway($tableGateway,$dbTableGatewayOptions);
        $dbTableGateway->open(null,$this->namespace);
        $this->getManager()->setSaveHandler($dbTableGateway);
    }
    public function getManager(){
        return $this->session->getManager();
    }
    public function isEmpty(){

    }

    public function read(){

    }

    public function write($contents){

    }

    public function clear(){

    }
    public function setDbAdapter(Adapter $adapter){
        $this->adapter=$adapter;

    }
}