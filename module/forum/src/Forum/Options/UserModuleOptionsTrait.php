<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/24
 * Time: 19:32
 */
namespace User\Options;
Trait UserModuleOptionsTrait{
    protected  $userModuleOptions;
    public function setUserModuleOptions(UserModuleOptions $userModuleOptions)
    {
        $this->userModuleOptions=$userModuleOptions;

    }
    public function getUserModuleOptions()
    {

    }
}