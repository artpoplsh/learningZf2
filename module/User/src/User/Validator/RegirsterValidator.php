<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/5/3
 * Time: 19:34
 */

namespace User\Validator;
use Zend\Validator\AbstractValidator;
use Zend\Validator\EmailAddress;
class RegirsterValidator extends AbstractValidator{
   // protected $options;
    public function __construct($options=null){

    }
    protected $messageTemplates = array(
        'email'=> "请填写有效邮箱",
        'password'=> "密码必须为6-12位",
        'password_second'=> "两次密码不一致",
    );

    public function isValid($value){
          $isValid=true;
         $options=iterator_to_array($value);
         $this->setOptions($options);
         $EmailValidator=new EmailAddress();
        //var_dump($options);exit;
         if(!$EmailValidator->isValid($options['username'])){
             $this->error("请填写有效邮箱");
             $isValid=false;
         }
        $LengthValidator=new \Zend\Validator\StringLength(['min'=>6,'max'=>12]);
        if(!$LengthValidator->isValid($options['password'])){
            $this->error("密码必须为6-12位");
        }

        if($options['password']!==$options['password1']){
            $this->error("两次密码不一致");
            var_dump($this);
            echo "----";
            var_dump($this->getMessages());exit;
        }
    }


    /**
     * @return array
     */
    public function getOptions()
    {
        return $this->options;
    }

    /**
     * @param array $options
     */
    public function setOptions($options=[])
    {
        $this->options = $options;
        return $this;
    }
}