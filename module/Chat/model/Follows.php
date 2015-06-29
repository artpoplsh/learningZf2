<?php 
namespace Chat\Model;

class Follows
{
    public $id;
    public $username;
    public $follows;

    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : null;
        $this->username = (!empty($data['username'])) ? $data['username'] : null;
        $this->follows = (!empty($data['follows'])) ? $data['follows'] : null;
    }
}