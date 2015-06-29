<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

return array(
    'controllers' => array(
        'invokables' => array(
            'Meeting\Controller\Meeting' => 'Meeting\Controller\IndexController',
        ),
    ),

    // The following section is new and should be added to your file
    'router' => array(
        'routes' => array(
            'meeting' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/meeting[/:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Meeting\Controller\Meeting',
                        'action'     => 'index',
                    ),
                ),
            ),
        ),
    ),

    'view_manager' => array(
        'template_path_stack' => array(
            'meeting' => __DIR__ . '/../src/Meeting/View',
        ),
        'template_map'=>[
            'meeting-layout'=>__DIR__.'/../src/Meeting/view/layout/layout.phtml'
        ]
    ),
);