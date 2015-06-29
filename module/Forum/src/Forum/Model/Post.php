<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/8
 * Time: 19:23
 */
namespace Forum\Model;

class Post {
    public $id;
    public $title;
    public $content;
    public $writer;
    public $commentNum;
    public $time;


    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : null;
        $this->title  = (!empty($data['title'])) ? $data['title'] : null;
        $this->content = (!empty($data['content'])) ? $data['content'] : null;
        $this->writer = (!empty($data['writer'])) ? $data['writer'] : null;
        $this->commentNum = (!empty($data['commentNum'])) ? $data['commentNum'] : null;
        $this->time = (!empty($data['time'])) ? $data['time'] : date("Y-m-d H:i:s");

    }
}