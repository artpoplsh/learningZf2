<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/4
 * Time: 21:55
 */

namespace User\Table;


use Zend\Db\TableGateway\TableGateway;

class UserTable {
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

    public function insertUser(User $user)
    {
        $data = array(
            'username' => $user->username,
            'password'  => $user->password,
            'email'=>$user->email
        );
        echo "data";
        var_dump($data);
        $id = (int) $user->id;
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

    public function getUser($email)
    {

        $rowset = $this->tableGateway->select(array('email' => $email));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $email");
        }
        return $row;
    }


}