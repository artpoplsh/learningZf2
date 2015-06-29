<?php
/**
 * Zend Framework (http://framework.zend.com/]
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c] 2005-2014 Zend Technologies USA Inc. (http://www.zend.com]
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

 return [
     'controllers' => [
         'invokables' => [
             'User\Controller\User' => 'User\Controller\UserController',
             'User\Controller\UserCenter' => 'User\Controller\UserCenterController',

         ],
         'initializers'=>[
             'User\Service\Initializer\UserModuleOptions'
         ]
     ],

     // The following section is new and should be added to your file
     'router' => [
         'routes' => [
             'User' => [
                 'type'    => 'segment',
                 'options' => [
                     'route'    => '/user[/:action][/:id]',
                     'constraints' => [
                         'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                         'id'     => '[0-9]+',
                     ],
                     'defaults' => [
                         'controller' => 'User\Controller\User',
                         'action'     => 'index',
                     ],
                 ],
             ],
             'UserCenter' => [
                 'type'    => 'segment',
                 'options' => [
                     'route'    => '/user-center[/:action][/:id]',
                     'constraints' => [
                         'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                         'id'     => '[0-9]+',
                     ],
                     'defaults' => [
                         'controller' => 'User\Controller\UserCenter',
                         'action'     => 'index',
                     ],
                 ],
             ],
         ],
     ],

     'view_manager' => [
         'template_path_stack' => [
             'User' => __DIR__ .'/../src/User/View',
         ],
     ],

     'user' => [
         'disabled_register'=>false,
         'disabled_login'=>false

     ],
     'service_manager'=>[
          'factories'=>[
              'UserModuleOptions'=>'User\Service\Factory\UserModuleOptions',

          ],
         'invokables'=>[
             'User\Table\UserTable'=>'User\Table\UserTable'
         ]
     ]
 ];