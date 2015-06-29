<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/17
 * Time: 21:57
 */

namespace Chat\Model;


class ChatMes {
    public $id;
    public $sender;
    public $getter;
    public $content;
    public $isread;
    public $time;

    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : null;
        $this->sender = (!empty($data['sender'])) ? $data['sender'] : null;

        $this->getter = (!empty($data['getter'])) ? $data['getter'] : null;
        $this->content = (!empty($data['content'])) ? $data['content'] : null;
        $this->isread = 1;
        $this->time = (!empty($data['time'])) ? $data['time'] : date("Y-m-d H:i:s");
    }
}