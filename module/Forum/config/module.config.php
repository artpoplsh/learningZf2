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
             'forum\Controller\forum' => 'Forum\Controller\IndexController',
         ],

     ],

     // The following section is new and should be added to your file
     'router' => [
         'routes' => [
             'forum' => [
                 'type'    => 'segment',
                 'options' => [
                     'route'    => '/forum[/:action][/:id]',
                     'constraints' => [
                         'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                         'id'     => '[0-9]+',
                     ],
                     'defaults' => [
                         'controller' => 'forum\Controller\forum',
                         'action'     => 'index',
                     ],
                 ],
             ],

         ],
     ],

     'view_manager' => [
         'template_path_stack' => [
             'Forum' => __DIR__ .'/../src/Forum/View',
         ],
     ],


 ];