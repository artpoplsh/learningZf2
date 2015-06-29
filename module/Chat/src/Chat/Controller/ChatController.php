<?php 
namespace Chat\Controller;
use Chat\Model\ChatMes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;
require_once '/var/www/zf2/module/Chat/model/ChatMes.php';
class ChatController extends AbstractActionController{
    public function indexAction(){
      exit("edygye");
    }

    public function getFriendListAction(){
        $sessionContainer=new Container();
        $userData=$sessionContainer->offsetGet("user");
        $username=$userData["username"];
        $follows=$this->getFollowsTable()->getFollowsByUsername($username);
        //$arr=['dsudgyu'];
        $jsonData = Json::encode($follows);

        $view =  new ViewModel(array(
            'jsonData' => $jsonData
        ));

        $view->setTerminal(true);

        return $view;


    }
    
    public function sendMesAction()
    {
        $parames=$this->getRequest()->getPost();
        $sessionContainer=new Container();
        $userData=$sessionContainer->offsetGet("user");
        $data=iterator_to_array($parames);
        $data['sender']=$userData["username"];
        $chatMes=new ChatMes();
        $chatMes->exchangeArray($data);
        $this->getChatMesTable()->saveChatMes($chatMes);
        exit("edit");
    }


    public function getMesAction(){
        //$sender=$this->getRequest()->getPost('sender');
        $sessionContainer=new Container();
        $userData=$sessionContainer->offsetGet("user");
        $getter=$userData['username'];
        $res=$this->getChatMesTable()->getChatMesByGetter($getter);
        foreach($res as $chatMes){
            $this->getChatMesTable()->setIsRead2zero($chatMes);
        }
        $jsonData = Json::encode($res);

        $view =  new ViewModel(array(
            'jsonData' => $jsonData
        ));

        $view->setTerminal(true);

        return $view;
    }

    public function getAllMesAction(){
        $sender=$this->getRequest()->getPost('sender');
        $sessionContainer=new Container();
        $userData=$sessionContainer->offsetGet("user");
        $getter=$userData['username'];
        $res=$this->getChatMesTable()-> getAllMesByGetter($getter,$sender);

        $jsonData = Json::encode($res);

        $view =  new ViewModel(array(
            'jsonData' => $jsonData
        ));

        $view->setTerminal(true);

        return $view;
    }


    public function getChatMesTable()
    {
        return $this->getServiceLocator()->get('Chat\Model\ChatMesTable');

    }
    public function getFollowsTable()
    {
        return $this->getServiceLocator()->get('Chat\Model\FollowsTable');
    }
}