<?php
/**
 * Created by PhpStorm.
 * User: lsh_monster
 * Date: 2015/4/22
 * Time: 21:08
 */
namespace User\Controller;
use User\Options\UserModuleOptions;
use User\Options\UserModuleOptionsAwareInterface;
use User\Options\UserModuleOptionsTrait;
use User\Table\User;
use Zend\Authentication\Adapter\DbTable\CredentialTreatmentAdapter;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Session;
use Zend\Mvc\Controller\AbstractActionController;
use User\Validator\RegirsterValidator;
use Zend\Session\Container;
use Zend\Session\SessionManager;
use Zend\Session\Storage\ArrayStorage;

class UserController extends AbstractActionController implements UserModuleOptionsAwareInterface{
    use UserModuleOptionsTrait;

    public function indexAction(){

    }
    public function loginAction()
    {

        if($this->userModuleOptions->getDisabledLogin()){
            echo "禁止登陆";
           exit("indexuser");

            //$b=$aaa['user'];
        }
        $options=$this->getRequest()->getPost();


            $adapter=$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
            $authAdapter=new CredentialTreatmentAdapter($adapter,'user','email','password');
            $authAdapter->setIdentity($options->get('email'));
            $authAdapter->setCredential($options->get('password'));

            $authService=new AuthenticationService(new Session('email'),$authAdapter);
        /*$authService = $this->getServiceLocator()->get('my_auth_service');
        $authService->setStorage(new Session('username'));
        $authService->setAdapter($authAdapter);*/


        $result=$authService->authenticate();

            if($result->isValid()){
//                $storage=new ArrayStorage(iterator_to_array($options));
//                $manager=new SessionManager();
//                $manager->setStorage($storage);
                $userData=$this->getServiceLocator()->get('User\Table\UserTable')->getUser($options->get('email'));

                $sessionContainer=new Container();
                $sessionContainer->offsetSet("user",["username"=>$userData->username,"email"=>$options->get('email')]);

                $this->layout()->setVariable("username",$userData->username);//how to asign?
               if ($user = $authService->getIdentity()) {

                $this->redirect()->toRoute('forum',['controller'=>'index','action'=>'index']);
               } else {
                    echo 'Not logged in';
                }
               // exit("suceess");
            }else{
                exit("die");
            }


    }

    public function registerAction(){
        $options=$this->getRequest()->getPost();
        $user=new User();
        $user->exchangeArray(iterator_to_array($options));
        var_dump($user);
        $res=$this->getServiceLocator()->get('User\Table\UserTable')->insertUser($user);

        $this->redirect()->toRoute('application');

    }
}