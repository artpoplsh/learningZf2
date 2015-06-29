<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 21:08
 */
namespace Forum\Controller;
use Forum\Model\Post;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;

class IndexController extends AbstractActionController {

    public function indexAction()
    {
        return [
           'posts'=>$this->getPostTable()->fetchAll()
        ];
    }

    public function addAction(){
        $sessionContainer=new Container();
        $userData=$sessionContainer->offsetGet("user");
        //var_dump($this->getRequest()->getPost());
        $parames=$this->getRequest()->getPost();
        $data=iterator_to_array($parames);
        $data['writer']=$userData["username"];
        $post=new Post();
        $post->exchangeArray($data);
        $res=$this->getPostTable()->insert($post);//为什么tablegateway插入成功的返回值为null？
        $this->redirect()->toRoute("forum",["controller"=>"index","action"=>"index"]);

    }

    public function detailAction(){
        $id = (int) $this->params()->fromRoute('id', 0);
        return [
            'post'=>$this->getPostTable()->getPost($id)
        ];

    }

    public function getPostTable(){
        return $this->getServiceLocator()->get('Post\Table\PostTable');
    }

}