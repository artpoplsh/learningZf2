<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/23
 * Time: 18:05
 */
namespace User\Controller;
use Zend\Mvc\Controller\AbstractActionController;

class  UserCenterController extends AbstractActionController{
    function indexAction(){
        $aaa=$this->getServiceLocator()->get('UserModuleOptions');
        echo "禁止登陆";
        exit("centerindex");
    }
}