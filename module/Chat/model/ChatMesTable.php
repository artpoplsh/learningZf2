<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/17
 * Time: 21:57
 */

namespace Chat\Model;


use Zend\Db\Sql\Where;
use Zend\Db\TableGateway\TableGateway;

class ChatMesTable {
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }


    public function getAllMesByGetter($getter,$sender)//读取历史消息
    {
        $where=new Where();
        $where->equalTo('getter',$getter);
        $where->equalTo('sender',$sender);
        $where->equalTo('isread',0);
        $where->or;
        $where->equalTo('getter',$sender);
        $where->equalTo('sender',$getter);
        //$where->equalTo('isread',0);
        $rowset = $this->tableGateway->select($where);

        return iterator_to_array($rowset);
    }
    public function getChatMesByGetter($getter)//读取未读信息
    {
        $where=new Where();
        $where->equalTo('getter',$getter);
        $where->equalTo('isread',1);
        $rowset = $this->tableGateway->select($where);

        return iterator_to_array($rowset);
    }

    public function saveChatMes(ChatMes $ChatMes)
    {
        $data = array(
            'sender' => $ChatMes->sender,
            'getter'  => $ChatMes->getter,
            'content'=>$ChatMes->content,
            'isread'=>$ChatMes->isread,
            'time'=>$ChatMes->time
        );

         $this->tableGateway->insert($data);

    }

    public function setIsRead2zero(ChatMes $ChatMes){
        $data = array(
            'isread'=>0,
        );
        $this->tableGateway->update($data, array('id' =>$ChatMes->id));
    }
}