<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/8
 * Time: 19:41
 */

namespace Forum\Model;


use Zend\Db\TableGateway\TableGateway;

class PostTable {
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

    public function getPost($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }

    public function insert(Post $post)
    {
        $data = array(
            'content'=>$post->content,
            'title'  => $post->title,
            'writer' => $post->writer,
            'time'=>$post->time
        );

        $this->tableGateway->insert($data);

    }

    public function deletePost($id)
    {
        $this->tableGateway->delete(array('id' => (int) $id));
    }
}