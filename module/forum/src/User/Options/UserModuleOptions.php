<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/23
 * Time: 18:35
 */

namespace User\Options;


use Zend\Stdlib\AbstractOptions;

class UserModuleOptions extends AbstractOptions{
    const CONFIG_KEY='user';
    protected $disabledRegister;
    protected $disabledLogin;

    /**
     * @return mixed
     */
    public function getDisabledLogin()
    {
        return $this->disabledLogin;
    }

    /**
     * @param mixed $disabledLogin
     *      * @return mixed
     */
    public function setDisabledLogin($disabledLogin)
    {
        $this->disabledLogin = $disabledLogin;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getDisabledRegister()
    {
        return $this->disabledRegister;
    }

    /**
     * @param mixed $disabledRegister
     */
    public function setDisabledRegister($disabledRegister)
    {
        $this->disabledRegister = $disabledRegister;
        return $this;

    }


}