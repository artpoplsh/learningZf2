<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/13
 * Time: 22:39
 */

namespace User\Table;


use Zend\Db\TableGateway\TableGateway;

class UserMessageTable {
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }


    public function updateUserMessage(UserMessage $userMessage)
    {
        $data = array(
            'username' => $userMessage->username,
            'password'  => $userMessage->password,
        );
        echo "data";
        var_dump($data);
        $id = (int) $userMessage->id;
        if ($id == 0) {
            return $this->tableGateway->insert($data);
        } else {
            if ($this->getUser($id)) {
                return $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('User id does not exist');
            }
        }

    }

    public function getUserMessage($username)
    {

        $rowset = $this->tableGateway->select(array('username' => $username));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $$username");
        }
        return $row;
    }


}