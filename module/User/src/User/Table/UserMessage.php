<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/13
 * Time: 22:38
 */
namespace User\Table;


class UserMessage{
    public $id;
    public $username;
    public $realname;
    public $sex;
    public $birthday;
    public $introduce;
    public $phone;
    public $wechat;
    public $weibo;

    public function exchangeArray($data)
    {
        $this->id     = (!empty($data['id'])) ? $data['id'] : '未填写';
        $this->username = (!empty($data['username'])) ? $data['username'] : '未填写';
        $this->realname  = (!empty($data['realname'])) ? $data['realname'] : '未填写';
        $this->sex     = (!empty($data['sex '])) ? $data['sex '] : '未填写';
        $this->birthday     = (!empty($data['birthday'])) ? $data['birthday'] : '未填写';
        $this->introduce = (!empty($data['introduce'])) ? $data['introduce'] : '未填写';
        $this->phone  = (!empty($data['phone'])) ? $data['phone'] : '未填写';
        $this->wechat     = (!empty($data['wechat'])) ? $data['wechat'] : '未填写';
        $this->weibo     = (!empty($data['weibo'])) ? $data['weibo'] : '未填写';

    }

}