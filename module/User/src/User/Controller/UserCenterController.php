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

    }
    function userMessageAction(){
        $sessionContainer=new \Zend\Session\Container();
        $user=$sessionContainer->offsetGet("user");
        $username=$user['username'];
        $userMessage=$this->getUserMessageTable()->getUserMessage($username);
        return [
            'userMessage'=>$userMessage
        ];
    }

    function saveUserMessageAction(){
        $userMes=$this->getRequest()->getPost();
        //var_dump($userMes);
        $this->redirect()->toRoute('UserCenter',['controller'=>'UserCenter','action'=>'userMessage']);
    }




    function getUserMessageTable(){
        return $this->getServiceLocator()->get('User\Table\UserMessageTable');
    }
}