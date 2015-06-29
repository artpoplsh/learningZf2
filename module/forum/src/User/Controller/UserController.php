<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 21:08
 */
namespace User\Controller;
use User\Options\UserModuleOptions;
use User\Options\UserModuleOptionsAwareInterface;
use User\Options\UserModuleOptionsTrait;
use Zend\Mvc\Controller\AbstractActionController;
class UserController extends AbstractActionController implements UserModuleOptionsAwareInterface{
    use UserModuleOptionsTrait;

    public function loginAction()
    {
        if($this->userModuleOptions->getDisabledLogin()){
            echo "禁止登陆";
           exit("indexuser");

            //$b=$aaa['user'];
        }
        $a=$this->getRequest();
        var_dump($a);exit;
        return [];
    }

    public function register(){
        return [];
    }
}