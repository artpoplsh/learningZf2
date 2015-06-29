<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/23
 * Time: 23:53
 */

namespace User\Options;


interface UserModuleOptionsAwareInterface {
    public function setUserModuleOptions(UserModuleOptions $UsermoduleOptions);
    public function getUserModuleOptions();

}