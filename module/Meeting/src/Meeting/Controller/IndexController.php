<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 21:08
 */
namespace Meeting\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;

class IndexController extends AbstractActionController{

    public function indexAction()
    {
        $ip=$_SERVER['REMOTE_ADDR'];
        $url="http://api.map.baidu.com/location/ip?ak=hRdsQSLfoqRK79ZLd8pLUd6t&ip=211.80.196.1&coor=bd09ll";
            $content = file_get_contents($url)?file_get_contents($url):'{"无法定位"}';
            $b=json_decode($content,true);
            //var_dump($b);

        return["b"=>$b];

         //$this->redirect()->toUrl($url);


    }

    public function locationAction(){


    }


}