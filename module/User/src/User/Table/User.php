<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/4
 * Time: 22:58
 */

namespace User\Table;


class User {
    public $id;
    public $username;
    public $password;
    public $email;

    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : null;
        $this->username = (!empty($data['username'])) ? $data['username'] : null;
        $this->password  = (!empty($data['password'])) ? $data['password'] : null;
        $this->email     = (!empty($data['email'])) ? $data['email'] : null;
    }
}