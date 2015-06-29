<?php 
namespace Chat\Model;

use Zend\Db\TableGateway\TableGateway;

class FollowsTable
{
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

    public function getFollowsByUsername($username)
    {

        $rowset = $this->tableGateway->select(array('username' =>$username));
        //$row = $rowset->current();
       /* $arr=[];
        while($row) {
           //throw new \Exception("Could not find row ");

            $arr=$row;
            $row = $rowset->current();
        }*/
        return iterator_to_array($rowset);
    }

    public function saveChat(Chat $Chat)
    {
        $data = array(
            'artist' => $Chat->artist,
            'title'  => $Chat->title,
        );

        $id = (int) $Chat->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getChat($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Chat id does not exist');
            }
        }
    }

    public function deleteChat($id)
    {
        $this->tableGateway->delete(array('id' => (int) $id));
    }
}