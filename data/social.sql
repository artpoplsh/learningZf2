-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015-08-16 15:31:58
-- 服务器版本: 5.5.44-0ubuntu0.14.04.1
-- PHP 版本: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `social`
--

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `album`
--

INSERT INTO `album` (`id`, `artist`, `title`) VALUES
(1, 'The  Military  Wives', 'In  My  Dreams'),
(2, 'Adele', '21'),
(3, 'Bruce  Springsteen', 'Wrecking Ball (Deluxe)'),
(4, 'Lana  Del  Rey', 'Born  To  Die'),
(5, 'Gotye', 'Making  Mirrors');

-- --------------------------------------------------------

--
-- 表的结构 `chatmes`
--

CREATE TABLE IF NOT EXISTS `chatmes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sender` varchar(100) NOT NULL,
  `getter` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `isread` int(11) NOT NULL DEFAULT '1',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `chatmes`
--

INSERT INTO `chatmes` (`id`, `sender`, `getter`, `content`, `isread`, `time`) VALUES
(1, 'artpop', 'theFame', '你好', 0, '2015-05-17 16:45:48'),
(2, 'theFame', 'artpop', '你也好', 0, '2015-05-17 22:54:54'),
(3, 'cheekTocheek', 'artpop', '我是cheekTocheek', 0, '2015-05-18 16:15:03'),
(4, 'artpop', 'theFame', '答辩v', 0, '2015-05-18 13:43:46'),
(5, 'theFame', 'artpop', '今天不开心了', 0, '2015-05-18 19:46:09'),
(6, 'theFame', 'artpop', '我又来了', 0, '2015-05-18 19:52:10'),
(7, 'theFame', 'artpop', '现在可以聊天了吗？', 0, '2015-05-18 14:00:27'),
(8, 'artpop', 'theFame', '可以ａ　', 0, '2015-05-18 14:00:44'),
(9, 'artpop', 'theFame', '今天很开心了', 0, '2015-05-18 14:01:51'),
(10, 'theFame', 'artpop', '我也是', 0, '2015-05-18 14:02:08'),
(11, 'artpop', 'cheekTocheek', '好久没和你说话了', 0, '2015-05-18 14:09:47'),
(12, 'cheekTocheek', 'artpop', '我是artpop', 0, '2015-05-18 14:12:33'),
(13, 'artpop', 'cheekTocheek', '哈哈哈，开心', 0, '2015-05-18 14:12:56'),
(14, 'theFame', 'cheekTocheek', '我们也可以说话了', 0, '2015-05-18 14:15:34'),
(15, 'cheekTocheek', 'theFame', '是啊，太好了', 1, '2015-05-18 14:16:35'),
(16, 'artpop', 'cheekTocheek', '你好惹', 0, '2015-05-27 12:54:55'),
(17, 'artpop', 'theFame', 'nihao a ', 1, '2015-06-23 17:55:04'),
(18, 'artpop', 'theFame', 'haha', 1, '2015-06-28 23:37:52');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL,
  `postId` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `follows`
--

CREATE TABLE IF NOT EXISTS `follows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `follows` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `follows`
--

INSERT INTO `follows` (`id`, `username`, `follows`) VALUES
(1, 'artpop', 'cheekTocheek'),
(2, 'cheekTocheek', 'artpop'),
(3, 'artpop', 'theFame'),
(4, 'theFame', 'artpop'),
(5, 'theFame', 'cheekTocheek'),
(6, 'cheekTocheek', 'theFame');

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `commentNum` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='帖子内容' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `writer`, `time`, `commentNum`) VALUES
(1, 'Zend Framework 2.0 (zf2) 正式版发布及新功能介绍[转]', '  著名php开源框架Zend Framework经历了长达数年的开发，终于在2012年9月5日正式发布了2.0版本，下简称ZF2。时隔Zend 1.0版本的发布已经有5年之久。php的框架一直都是百家争鸣的，但是作为php官方运维的框架，Zend Framework在php开发者中的流行度并不高。其一是由于Zend Framework主要面向大型应用，对代码规范以及程序结构有严格的规定，入门门槛较高。另一方面还是因为Zend Framework整体的执行效率偏低，略显笨重。\r\n所以Zend小组本次可谓痛定思痛，ZF2并不像其他框架只是修修补补的更新，而是完全重写了ZF1的所有代码，主打的口号就是“高性能”。\r\n\r\n来看一看ZF2都带开了哪些新的特性：\r\n\r\n1. 模块化（ModuleManager）\r\n比起ZF1来说，ZF2原生支持模块的概念，任意第三方php程序，只要遵循Zend的编码规范和代码结构，都可以变成一个Zend模块。目前已经有一批试验阶段的模块出炉（参看ZF2 Modules）。 其中不乏像Doctrine ORM这样优秀的项目。\r\n\r\n可以预见的是，随着ZF2的慢慢成熟，越来越多可以选择的模块将大量涌现，可能未来基于ZF2的项目开发，会像搭积木一样轻松简单。\r\n\r\n2. 事件驱动（EventManager）\r\n\r\n传统程序中，代码都是按线性顺序执行的，所以开发中往往很难将一些功能独立为一个组件或模块。\r\n\r\n事件驱动，或者也可以叫钩子（Hook），改变了普通程序流程化的运行方式，应用了事件驱动之后，程序将呈现“注册事件” => “触发事件”的跳跃式运行，可以在不影响原有程序代码的，很容易的在任意位置加入新的业务逻辑，让项目的开发变得极为灵活。\r\n\r\n3. 服务管理器（ServiceManager）\r\n\r\n服务管理器的概念来自于"服务定位模式（Service locator pattern）"的编程思想。这种思想提倡将程序中的每一个独立功能提取出来作为一个“服务”，每一个服务都是独立可唤醒的，只有服务被调用时，服务相关的程序才会启动。\r\n\r\n这也就是ZF2性能提升的秘密所在，ZF2的MVC启动流程中无处不体现ServiceLocator的思想，功能模块的调用极为“吝啬”，想必会给以前对Zend性能有意见的开发者一个大大的惊喜。\r\n"\\n"\r\n4. 依赖注入（Di Dependency Injection)\r\n\r\n依赖注入广泛应用于Java的主流框架中，可以很好的解除大型应用中的耦合。ZF2引入Di也经过了反复的考量和权衡，即使进入beta阶段，Di仍然一度作为ZF2的基本实现方案，整个Mvc的配置基于Di。最终为了避免陷入Di可能造成的元数据式编程泥潭（Metaprogramming）, Di只是作为ZF2的底层实现，上层加入了ServiceManager。普通开发者在使用ZF2的过程中不需要接触到Di的层面。不过这并不妨碍DI作为一个优秀的php组件存在并发挥作用。\r\n\r\n5. 社会化编程\r\n\r\nZF2的代码完全托管在Github，借助Github的优秀设计，任何人都可以轻松的通过fork参与ZF2的项目建设，甚至提交新的模块功能。笔者AlloVince也帮助Zend小组修复了一些BUG，发现Zend小组响应非常快（从没有超过24小时），对反馈的意见也会花时间认真解答。所以参与ZF2项目是参与php开源项目一个不错的选择。\r\n\r\n总结\r\n\r\n正如ZF2发布信息中写到的，没有哪个框架是完美的，ZF2也不例外。所以作为开发者要做的，不应该是纠结于哪个框架好哪个框架不好这种永远也得不到结论的问题，而是针对不同的项目选择合适的框架。\r\n\r\n在现阶段，开发大中型php应用，特别是商业应用和企业应用，ZF2是一个非常不错的选择，因为ZF2有严格代码规范，非常适合团队开发。而ZF2作为Zend官方的支持产品，整体的可靠性和BUG的响应速度也都是有保证的。\r\n相关资源', 'artpop', '2015-05-08 19:44:58', 1),
(2, 'Zend Framework 2.0的Mvc结构及启动流程分析[转]', '概要\r\n\r\n首先需要明确的是，Zend2.0的启动以及MVC构架是完全基于事件驱动的。如果对事件驱动还不太了解的话，应该先弄清楚什么是ZF2的事件驱动，并掌握基本的EventManager用法，这是阅读本文的基础。请参考Using the ZF2 EventManager。\r\n\r\n基于事件驱动MVC与传统的MVC有什么不同，简单说就是由传统的复杂流程式调用过程。变成了先在某处注册事件，然后在某处触发事件的简单二元关系，事件不受代码结构和调用流程的影响，可以方便的解除耦合。\r\n\r\n而在最近才引入的ServiceManager也是Zend1中完全没有的概念，在我的理解来看，ServiceManager的引入是ZF2开发小组对于引入Di可能带来的元数据式编程问题（Metaprogramming）的一种反思。\r\n\r\nServiceManager带来的好处是：\r\n\r\n    将整个Zend构架的主要部分形象化，让结构更有组织，更利于理解\r\n    简化Di的配置，降低学习成本\r\n    进一步弱化了Bootstrap，让整个启动过程更加简洁\r\n\r\nServiceManager带来的不好之处是：\r\n\r\n    将Di做一层封装，无法直接通过配置文件控制整个构架\r\n    自定义需求比较高的时候，反而提高了学习成本，因为在学习Di的同时还要学习ServiceManager\r\n\r\n那么闲聊至此，开始进入真正的Zend2.0 MVC构架流程分析，这里以5月21日的ZendSkeletonApplication为例：\r\n第一部分：初始化ServiceManager\r\n\r\nZendSkeletonApplication/public/index.php\r\n\r\n$configuration = include ''config/application.config.php'';\r\n$serviceManager = new ServiceManager(new ServiceManagerConfiguration($configuration[''service_manager'']));\r\n$serviceManager->setService(''ApplicationConfiguration'', $configuration);\r\n\r\n读取整个应用的基础配置文件，初始化Mvc框架所需要的ServiceManager。\r\n\r\n这个过程中默认所依赖的所有类都写在Zend\\Mvc\\Service\\ServiceManagerConfiguration中。ServiceManager的内部被划分为5类\r\n\r\n    services 服务\r\n    factories 工厂\r\n    abstractFactories 抽象工厂\r\n    aliases 别名\r\n    shared 共享服务\r\n\r\n项目的配置文件application.config.php会复写Zend的默认配置并载入，比如如果需要使用一个自定义的服务，可以在配置文件中这样写\r\n\r\n<?php\r\nreturn array(\r\n    ''service_manager'' => array(\r\n		''use_defaults'' => true,\r\n		''services'' => array(\r\n			''ViewManager''                  => ''EvaEngine\\Mvc\\View\\ModuleViewManager'',\r\n		),\r\n    ),\r\n);\r\n\r\n第二部分：初始化模块\r\n\r\nZendSkeletonApplication/public/index.php\r\n\r\n$serviceManager->get(''ModuleManager'')->loadModules();\r\n\r\nServiceManager中的ModuleManager，本质上是对Zend\\Mvc\\Service\\ModuleManagerFactory的一个封装，主要做的工作包括：\r\n\r\n    获得项目配置文件中需要载入的模块列表\r\n    按配置遍历模块，分别载入模块的配置文件\r\n    合并模块的配置文件\r\n\r\n在配置文件中，可以通过modules节点控制具体载入哪些模块。\r\n\r\n模块的载入同样采用了事件驱动，通过模块管理器Zend\\ModuleManager\\ModuleManager配合模块事件Zend\\ModuleManager\\ModuleEvent实现，在载入模块的过程中会依次触发\r\n\r\n    loadModules.pre 所有模块载入前\r\n    loadModule.resolve 每个模块载入\r\n    loadModule 每个模块载入后\r\n    loadModules.post 所有模块载入后\r\n\r\n第三部分：启动MVC\r\n\r\n终于到了MVC部分，整个MVC的流程都伴随着事件驱动，ZF2将其定义为MVC事件，按照执行顺序依次包括：\r\n\r\n    bootstrap 引导\r\n    route 路由\r\n    dispatch 分发\r\n    render 渲染\r\n    finish 结束\r\n\r\n所以为了方便说明，将\r\n\r\nZendSkeletonApplication/public/index.php的\r\n\r\n$serviceManager->get(''Application'')->bootstrap()->run()->send();\r\n\r\n拆分为三个阶段\r\nBootstrap引导阶段\r\n\r\n$app = $serviceManager->get(''Application'')->bootstrap();\r\n\r\n在Zend1中，Bootstrap曾经是MVC的核心部分，在ZF2中，由于事件驱动的引入，这一部分变得非常简单清晰：\r\n\r\n首先在Zend\\Mvc\\Application→bootstrap()中，注册了所有MVC事件，初始化MvcEvent（将Request/Response/Router等注入），同时触发bootstrap事件。\r\n\r\n这一过程中，View部分的初始化相对复杂，单独说明如下\r\nZend\\View的构成\r\n\r\n在ZF2中，View部分同样做了非常大的改动，将Layout，Helper都合并入View。在Zend1中，Layout是一个独立存在的组件，而ZF2中将Layout和Template统一称为ViewModel，ViewModel是树形结构，这样就可以实现模板的递归嵌套，而在ZF2中的Layout，本质上就是位于树形结构最底层的ViewModel。\r\n\r\nZF2的View由以下几个部分组成，称呼是AlloVince个人的翻译，不当之处还请指正:\r\n\r\n    View\\View 视图，主要接管MVC事件\r\n    View\\Strategy 策略器，统筹安排视图的主要容器Placeholders，同时会将视图的最终结果放入容器，拼合为最后呈现给用户的内容\r\n    View\\Resolver 决策器，定义模板命名与实际路径的映射关系，同时决定模板最终对应的实际文件\r\n    View\\Renderer 渲染器，在决策器的辅助下，将ViewModel转换为文本输出。一个渲染器必须对应一个决策器才能工作。\r\n    View\\Model 视图模型，包括了视图中可能用到的所有变量。自身为树形结构，一个视图模型可以包含若干子模型\r\n    View\\Helper 视图助手，辅助生成HTML标签\r\n\r\n在MVC构架中，Zend\\Mvc\\View\\ViewManager会整合上述所有部分，最终构成整个视图。\r\nZend\\View的初始化\r\n\r\n回到上一节，在bootstrap事件被触发时，视图部分做了一些主要的准备工作，包括：\r\n\r\n    指定一个MVC专用的策略器Zend\\Mvc\\View\\DefaultRenderingStrategy，在这个策略器中将最顶层的ViewModel重定义Layout。注册MvcEvent::EVENT_RENDER事件\r\n    注入模板监听Zend\\Mvc\\View\\InjectTemplateListener，最主要的作用是通过Controller和Action的名字来生成默认的视图名\r\n    注入视图模型监听Zend\\Mvc\\View\\InjectViewModelListener\r\n\r\n那么其实我们可以得出结论，Zend的Mvc中在bootstrap阶段，视图的所有准备工作都已经就绪了，并没有等到路由结束或者Controller启动。这样做的用意在于当路由失败时，仍然可以有对应的视图来呈现异常结果。\r\nMVC启动阶段\r\n\r\nZendSkeletonApplication/public/index.php\r\n\r\n$response = $app->run();\r\n\r\n启动阶段对应的事件有\r\n\r\n    route 路由\r\n    dispatch 分发\r\n\r\n如果异常发生，则会提前结束启动过程，分发事件有可能不会触发而直接触发finish(结束)事件。\r\nRoute路由启动\r\n\r\nZF2的路由最有意义的重构是允许路由以树形结构排布，路由之间可以设置优先级。简单的介绍可以参考Introducing Zend Framework 2.0 Router。所以ZF2的路由可以实现分别在每个模块下设置，同时可以在某些模块提高优先级别。非常适合大规模应用的部署。\r\n\r\n在路由启动过程中，Zend\\Mvc\\RouteListener→onRoute()被触发，路由从树形结构逐一匹配，最终以Zend\\Mvc\\Router\\RouteMatch对象的形式返回一个最适配的路由。\r\nDispatch分发过程\r\n\r\nZF2的Dispatch分发其实有两次，一次是在Zend\\Mvc\\Application中，目的是将匹配的RouteMatch通过参数定位到某个特定的Controller，另一次是在Zend\\Mvc\\Controller，目的是将Request/Response注入，同时运行对应的Action。\r\n\r\n流程如下\r\n\r\n//分发事件被触发\r\nZend\\Mvc\\DispatchListener->onDispatch();\r\n \r\n//根据匹配路由的参数定位到某个controller\r\n$controller = $controllerLoader->get($controllerName);\r\n \r\n//触发controlller的dispatch\r\n$return   = $controller->dispatch($request, $response);\r\n\r\n发送最终响应并结束MVC\r\n\r\nZendSkeletonApplication/public/index.php\r\n\r\n$response->send();\r\n\r\n分发结束后，如果正确的从controller获得响应，会继续运行\r\n\r\nZend\\Mvc\\Application->completeRequest()\r\n\r\n这里会触发MVC事件的最后两个\r\n\r\n    render 渲染\r\n    finish 结束\r\n\r\n//调用MVC默认策略器的render事件\r\nZend\\Mvc\\View\\DefaultRenderingStrategy->render();\r\n\r\nRender事件会将Zend\\View的各部分整合，最终组装成一个Zend\\Http\\PhpEnvironment\\Response，发送给用户。\r\n\r\n这就是Zend2.0的MVC完整过程。\r\n', 'artpop', '2015-05-09 16:10:00', 0),
(7, ' 数据库索引的实现原理 [转]', '数据库索引，是数据库管理系统中一个排序的数据结构，以协助快速查询、更新数据库表中数据。索引的实现通常使用B树及其变种B+树。\r\n\r\n在数据之外，数据库系统还维护着满足特定查找算法的数据结构，这些数据结构以某种方式引用（指向）数据，这样就可以在这些数据结构上实现高级查找算法。这种数据结构，就是索引。\r\n\r\n为表设置索引要付出代价的：一是增加了数据库的存储空间，二是在插入和修改数据时要花费较多的时间(因为索引也要随之变动)。\r\n上图展示了一种可能的索引方式。左边是数据表，一共有两列七条记录，最左边的是数据记录的物理地址（注意逻辑上相邻的记录在磁盘上也并不是一定物理相邻的）。为了加快Col2的查找，可以维护一个右边所示的二叉查找树，每个节点分别包含索引键值和一个指向对应数据记录物理地址的指针，这样就可以运用二叉查找在O(log2n)的复杂度内获取到相应数据。\r\n\r\n创建索引可以大大提高系统的性能。\r\n\r\n第一，通过创建唯一性索引，可以保证数据库表中每一行数据的唯一性。\r\n\r\n第二，可以大大加快数据的检索速度，这也是创建索引的最主要的原因。\r\n\r\n第三，可以加速表和表之间的连接，特别是在实现数据的参考完整性方面特别有意义。\r\n\r\n第四，在使用分组和排序子句进行数据检索时，同样可以显著减少查询中分组和排序的时间。\r\n\r\n第五，通过使用索引，可以在查询的过程中，使用优化隐藏器，提高系统的性能。 \r\n\r\n\r\n也许会有人要问：增加索引有如此多的优点，为什么不对表中的每一个列创建一个索引呢？因为，增加索引也有许多不利的方面。\r\n\r\n第一，创建索引和维护索引要耗费时间，这种时间随着数据量的增加而增加。\r\n\r\n第二，索引需要占物理空间，除了数据表占数据空间之外，每一个索引还要占一定的物理空间，如果要建立聚簇索引，那么需要的空间就会更大。\r\n\r\n第三，当对表中的数据进行增加、删除和修改的时候，索引也要动态的维护，这样就降低了数据的维护速度。\r\n\r\n\r\n索引是建立在数据库表中的某些列的上面。在创建索引的时候，应该考虑在哪些列上可以创建索引，在哪些列上不能创建索引。一般来说，应该在这些列上创建索引：在经常需要搜索的列上，可以加快搜索的速度；在作为主键的列上，强制该列的唯一性和组织表中数据的排列结构；在经常用在连接的列上，这些列主要是一些外键，可以加快连接的速度；在经常需要根据范围进行搜索的列上创建索引，因为索引已经排序，其指定的范围是连续的；在经常需要排序的列上创建索引，因为索引已经排序，这样查询可以利用索引的排序，加快排序查询时间；在经常使用在WHERE子句中的列上面创建索引，加快条件的判断速度。\r\n\r\n\r\n同样，对于有些列不应该创建索引。一般来说，不应该创建索引的的这些列具有下列特点：\r\n\r\n第一，对于那些在查询中很少使用或者参考的列不应该创建索引。这是因为，既然这些列很少使用到，因此有索引或者无索引，并不能提高查询速度。相反，由于增加了索引，反而降低了系统的维护速度和增大了空间需求。\r\n\r\n第二，对于那些只有很少数据值的列也不应该增加索引。这是因为，由于这些列的取值很少，例如人事表的性别列，在查询的结果中，结果集的数据行占了表中数据行的很大比例，即需要在表中搜索的数据行的比例很大。增加索引，并不能明显加快检索速度。\r\n\r\n第三，对于那些定义为text, image和bit数据类型的列不应该增加索引。这是因为，这些列的数据量要么相当大，要么取值很少。\r\n\r\n第四，当修改性能远远大于检索性能时，不应该创建索引。这是因为，修改性能和检索性能是互相矛盾的。当增加索引时，会提高检索性能，但是会降低修改性能。当减少索引时，会提高修改性能，降低检索性能。因此，当修改性能远远大于检索性能时，不应该创建索引。\r\n\r\n\r\n根据数据库的功能，可以在数据库设计器中创建三种索引：唯一索引、主键索引和聚集索引。\r\n唯一索引 \r\n\r\n唯一索引是不允许其中任何两行具有相同索引值的索引。\r\n当现有数据中存在重复的键值时，大多数数据库不允许将新创建的唯一索引与表一起保存。数据库还可能防止添加将在表中创建重复键值的新数据。例如，如果在employee表中职员的姓(lname)上创建了唯一索引，则任何两个员工都不能同姓。\r\n主键索引\r\n数据库表经常有一列或列组合，其值唯一标识表中的每一行。该列称为表的主键。\r\n在数据库关系图中为表定义主键将自动创建主键索引，主键索引是唯一索引的特定类型。该索引要求主键中的每个值都唯一。当在查询中使用主键索引时，它还允许对数据的快速访问。\r\n聚集索引\r\n在聚集索引中，表中行的物理顺序与键值的逻辑（索引）顺序相同。一个表只能包含一个聚集索引。\r\n\r\n如果某索引不是聚集索引，则表中行的物理顺序与键值的逻辑顺序不匹配。与非聚集索引相比，聚集索引通常提供更快的数据访问速度。\r\n\r\n\r\n\r\n局部性原理与磁盘预读\r\n\r\n由于存储介质的特性，磁盘本身存取就比主存慢很多，再加上机械运动耗费，磁盘的存取速度往往是主存的几百分分之一，因此为了提高效率，要尽量减少磁盘I/O。为了达到这个目的，磁盘往往不是严格按需读取，而是每次都会预读，即使只需要一个字节，磁盘也会从这个位置开始，顺序向后读取一定长度的数据放入内存。这样做的理论依据是计算机科学中著名的局部性原理：当一个数据被用到时，其附近的数据也通常会马上被使用。程序运行期间所需要的数据通常比较集中。\r\n\r\n由于磁盘顺序读取的效率很高（不需要寻道时间，只需很少的旋转时间），因此对于具有局部性的程序来说，预读可以提高I/O效率。\r\n\r\n预读的长度一般为页（page）的整倍数。页是计算机管理存储器的逻辑块，硬件及操作系统往往将主存和磁盘存储区分割为连续的大小相等的块，每个存储块称为一页（在许多操作系统中，页得大小通常为4k），主存和磁盘以页为单位交换数据。当程序要读取的数据不在主存中时，会触发一个缺页异常，此时系统会向磁盘发出读盘信号，磁盘会找到数据的起始位置并向后连续读取一页或几页载入内存中，然后异常返回，程序继续运行。\r\nB-/+Tree索引的性能分析\r\n\r\n到这里终于可以分析B-/+Tree索引的性能了。\r\n\r\n上文说过一般使用磁盘I/O次数评价索引结构的优劣。先从B-Tree分析，根据B-Tree的定义，可知检索一次最多需要访问h个节点。数据库系统的设计者巧妙利用了磁盘预读原理，将一个节点的大小设为等于一个页，这样每个节点只需要一次I/O就可以完全载入。为了达到这个目的，在实际实现B-Tree还需要使用如下技巧：\r\n\r\n每次新建节点时，直接申请一个页的空间，这样就保证一个节点物理上也存储在一个页里，加之计算机存储分配都是按页对齐的，就实现了一个node只需一次I/O。\r\n\r\nB-Tree中一次检索最多需要h-1次I/O（根节点常驻内存），渐进复杂度为O(h)=O(logdN)。一般实际应用中，出度d是非常大的数字，通常超过100，因此h非常小（通常不超过3）。\r\n\r\n而红黑树这种结构，h明显要深的多。由于逻辑上很近的节点（父子）物理上可能很远，无法利用局部性，所以红黑树的I/O渐进复杂度也为O(h)，效率明显比B-Tree差很多。\r\n\r\n\r\n综上所述，用B-Tree作为索引结构效率是非常高的。\r\n\r\n\r\n\r\n应该花时间学习B-树和B+树数据结构\r\n\r\n=============================================================================================================\r\n\r\n1）B树\r\n\r\nB树中每个节点包含了键值和键值对于的数据对象存放地址指针，所以成功搜索一个对象可以不用到达树的叶节点。\r\n\r\n成功搜索包括节点内搜索和沿某一路径的搜索，成功搜索时间取决于关键码所在的层次以及节点内关键码的数量。\r\n\r\n在B树中查找给定关键字的方法是：首先把根结点取来，在根结点所包含的关键字K1,…,kj查找给定的关键字（可用顺序查找或二分查找法），若找到等于给定值的关键字，则查找成功；否则，一定可以确定要查的关键字在某个Ki或Ki+1之间，于是取Pi所指的下一层索引节点块继续查找，直到找到，或指针Pi为空时查找失败。\r\n\r\n2）B+树\r\n\r\nB+树非叶节点中存放的关键码并不指示数据对象的地址指针，非也节点只是索引部分。所有的叶节点在同一层上，包含了全部关键码和相应数据对象的存放地址指针，且叶节点按关键码从小到大顺序链接。如果实际数据对象按加入的顺序存储而不是按关键码次数存储的话，叶节点的索引必须是稠密索引，若实际数据存储按关键码次序存放的话，叶节点索引时稀疏索引。\r\n\r\nB+树有2个头指针，一个是树的根节点，一个是最小关键码的叶节点。\r\n\r\n所以 B+树有两种搜索方法：\r\n\r\n一种是按叶节点自己拉起的链表顺序搜索。\r\n\r\n一种是从根节点开始搜索，和B树类似，不过如果非叶节点的关键码等于给定值，搜索并不停止，而是继续沿右指针，一直查到叶节点上的关键码。所以无论搜索是否成功，都将走完树的所有层。\r\n\r\nB+ 树中，数据对象的插入和删除仅在叶节点上进行。\r\n\r\n这两种处理索引的数据结构的不同之处：\r\na，B树中同一键值不会出现多次，并且它有可能出现在叶结点，也有可能出现在非叶结点中。而B+树的键一定会出现在叶结点中，并且有可能在非叶结点中也有可能重复出现，以维持B+树的平衡。\r\nb，因为B树键位置不定，且在整个树结构中只出现一次，虽然可以节省存储空间，但使得在插入、删除操作复杂度明显增加。B+树相比来说是一种较好的折中。\r\nc，B树的查询效率与键在树中的位置有关，最大时间复杂度与B+树相同(在叶结点的时候)，最小时间复杂度为1(在根结点的时候)。而B+树的时候复杂度对某建成的树是固定的。', 'artpop', '2015-05-12 12:21:30', 0),
(8, 'php session 数据保存在哪里?', ' SESSION 的数据保存在哪里呢？\r\n\r\n     当然是在服务器端，但不是保存在内存中，而是保存在文件或数据库中。\r\n\r\n     默认情况下，php.ini 中设置的 SESSION 保存方式是 files（session.save_handler = files），即使用读写文件的方式保存 SESSION 数据，而 SESSION 文件保存的目录由 session.save_path 指定，文件名以 sess_ 为前缀，后跟 SESSION ID，如：sess_c72665af28a8b14c0fe11afe3b59b51b。文件中的数据即是序列化之后的 SESSION 数据了。\r\n\r\n     如果访问量大，可能产生的 SESSION 文件会比较多，这时可以设置分级目录进行 SESSION 文件的保存，效率会提高很多，设置方法为：session.save_path="N;/save_path"，N 为分级的级数，save_path 为开始目录。\r\n\r\n     当写入 SESSION 数据的时候，PHP 会获取到客户端的 SESSION_ID，然后根据这个 SESSION ID 到指定的 SESSION 文件保存目录中找到相应的 SESSION 文件，不存在则创建之，最后将数据序列化之后写入文件。读取 SESSION 数据是也是类似的操作流程，对读出来的数据需要进行解序列化，生成相应的 SESSION 变量。', 'artpop', '2015-05-14 10:58:09', 0),
(9, 'session多服务器共享的方案梳理【转】', 'session的存储了解以前是怎么做的，搞清楚了来龙去脉，才会明白进行共享背后的思想和出发点。我喜欢按照这样的方式来问(或者去搞清楚)：为什么要session要进行共享，不共享会什么问题呢？\r\n\r\n \r\n\r\n php中session的原理，以前做了一下总结，可以参考：http://www.cnblogs.com/wangtao_20/archive/2011/02/16/1955659.html\r\n\r\n \r\n\r\n以前业界使用session的做法：\r\n\r\n \r\n\r\n默认情况下，php的session文件是保存在磁盘文件中。在php.ini配置文件中的配置项如下：\r\n\r\n \r\n\r\nsession.save_handler = files\r\n\r\n \r\n\r\nsession.save_path = "N;/path"\r\n\r\n \r\n\r\n第一个配置项是指定使用files(文件形式)存储session数据。\r\n\r\n \r\n\r\n第二个参数指定保存的路径。N表示生成多少级目录(不放到一个目录下，分散到多个磁盘目录中去)\r\n\r\n \r\n\r\n我的配置项是：session.save_path = "F:/wamp/tmp"。那么就会去这个目录下面看到很多session数据的文件。\r\n\r\n \r\n\r\n当我们使用php的内置函数session_start()的时候，就是去上面指定的磁盘目录把session数据载入，实际上就是拿类似\r\n\r\nsess_74dd7807n2mfml49a1i12hkc45的文件。\r\n\r\n \r\n\r\n \r\n\r\n74dd7807n2mfml49a1i12hkc45就是大家经常说的什么session的id号。\r\n\r\n \r\n\r\nphp.ini中还有一个关键配置项，如下：\r\n\r\n \r\n\r\nsession.name = PHPSESSID\r\n\r\n \r\n\r\n \r\n\r\nPHPSESSID就是cookie的名称，其实上面一串"74dd7807n2mfml49a1i12hkc45"会保存在一个名为PHPSESSID的cookie中。\r\n\r\n \r\n\r\n根据http的请求机制，当浏览器请求的时候，头部信息会把浏览器中的cookie一起发给服务器。PHPSESSID这个cookie也\r\n\r\n是在其中发给了服务器，php引擎通过读取PHPSESSID的值来确定要载入哪个session文件。\r\n\r\n比如值为74dd7807n2mfml49a1i12hkc45，载入的就是"sess_74dd7807n2mfml49a1i12hkc45"。\r\n\r\n \r\n\r\n注：当你调用php的函数session_start(),才表明你需要使用session文件了。不然平白无故就去载入文件，浪费性能。\r\n\r\n \r\n\r\n===========================================\r\n\r\n \r\n\r\n根据如上原理。session的数据默认是保存在磁盘文件中。假设这种情况：多台php服务器进行负载均衡的时候，比如有三台php服务器，为了实现负载均衡，那么三台服务器上面的php代码都是一样(拷贝一份)。\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n上面的图是nginx+fpm部署图。可以看到多台php服务器进行负载均衡。\r\n\r\n \r\n\r\n \r\n\r\n生成session数据文件都是在本地了(a,b,c各自的服务器磁盘上)。负载均衡的目的本来就是要为了平均分配请求，所以没有固定第一次访问和第二次访问是同一台服务器，实际上无法确定的。第一秒访问可能是a服务器，第二秒访问的可能是c服务器。\r\n\r\n所以同一个登录会员，实际上就会出现：第一秒访问第一台php服务器，第二秒访问的是第二台服务器。登录的信息一般是保存在session中的。这样子登录保存的session数据就需要进行共享了。不然的话会出现，访问第一台服务器生成了一个session数据。第二秒负载请求到第三台服务器，结果获取不到刚才生成的session数据。\r\n\r\n \r\n\r\n我的理解是：只有涉及到多台多台后端服务器(php,java等处理服务器)的时候，才涉及到session读取不到的问题。\r\n\r\n在php环境中，只有多台php服务器(php服务器而非web服务器,session文件是php引擎生成的)的情况下，才会涉及到\r\n\r\nsession共享的问题。单台php服务器，存储都在一台主机上。不涉及到共享问题。因为session直接存储在这台服务器磁盘上是能够被本机读取到的。\r\n\r\n \r\n\r\n如果是：一台php服务器，多台mysql服务器。这种也是负载均衡，这种负载均衡不涉及到共享问题。因为怎么session数据怎么操作都是保存在一台服务器上。\r\n\r\n \r\n\r\n==================================\r\n\r\nps：实际上，session在php,.net,java等只要是后端语言都会用到。session的存储机制，各种语言都大体差不多。我觉得这跟cookie在各个语言中都会用到差不多。.net，java我没去了解过。但是存储原理是差不多的。区别就是，php，java，.net调用的函数，读和取session数据的方式不同。默认都是存储在本地文件中的(不然怎么会涉及到session共享问题呢，存储在数据库本身就可以实现共享的)。\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n所以，无论是.net还是java都会涉及到session数据共享的问题。\r\n\r\n其实我的理解是，session的原理都是一样的。讨论session共享方案设计，是可以抛开具体的语言去讨论session共享方案设计。\r\n\r\n \r\n\r\n \r\n\r\n目前业界解决session共享的几种思路，我总结如下：\r\n\r\n \r\n\r\n第一种办法：把原来存储在服务器磁盘上的session数据存储到客户端的cookie中去。\r\n\r\n这样子，就不需要涉及到数据共享了。a客户端请求的时候，原来生成在服务器的数据生成到浏览器的cookie中，根据cookie中的数据识别用户。php由原来的”从本地(也就是服务器)磁盘上读取session数据”转变为”浏览器的cookie中读取数据”，\r\n\r\n这样子，在多台php服务器负载均衡的情况下，即便第一秒请求是a服务器，第二秒请求是b服务器，都不需要管哪台服务器了。反正都是读取客户端上的cookie数据。\r\n\r\n一般是把session数据按照自己定义的加密规则，加密后后存在cookie中。\r\n\r\n数据保存在cookie中这种做法有好处，也有坏处。\r\n\r\n好处是服务器的压力减小了，因为session数据不存在服务器磁盘上。根本就不会出现session读取不到的问题。\r\n\r\n带来的弊端是：\r\n\r\n网络请求占用很多。每次请求时，客户端都要通过cookie发送session数据给服务器。\r\n\r\n另外，浏览器对cookie的大小存在限制。每个浏览器限制是不同的。\r\n\r\nFirefox和Safari允许cookie多达4097个字节，包括名（name）、值（value）和等号。\r\n\r\n　　Opera允许cookie多达4096个字节，包括：名（name）、值（value）和等号。\r\n\r\n　　Internet Explorer允许cookie多达4095个字节，包括：名（name）、值（value）和等号。\r\n\r\n \r\n\r\n所以第一种方案不适合高访问量的情况下，因为高访问量的情况下，每次请求浏览器都要发送session数据给服务器。一般一个cookie大小2k的样子。\r\n\r\n要占用很多带宽了(服务器购买带宽是一个很大费用)，成本增高。归纳为带宽性能，速度问题。\r\n\r\n存储到cookie中去，第二方面是安全问题：把session数据放到客户端，一般session中存的都是重要性数据(帐号、昵称、用户id等)，会存在安全问题。\r\n\r\n了解到，淘宝以前用过这种方式，把session数据存储到cookie中，根据cookie来识别用户。\r\n\r\n \r\n\r\n第二种思路：用一种算法(简单理解为规则)，什么机制下session是保存在哪台服务器下，那么读取的时候就按照这种规则去读取，就能定位到原来的服务器。叫做分发请求，分发到特定的服务器上去，我理解其原理是存session和读session数据保证都在一台服务器操作，就不会需要涉及到共享，具体实现方式是通过约定一种分发机制来实现。\r\n\r\n也叫做sticky模式(粘性会话模式)，同一个用户的访问请求都被派送到同一个服务器上。\r\n\r\n假设是同一个用户user1，每次访问都路由到同一台服务器上,这样即便是在负载均衡的情况下，也能保证每次访问都能读取到session，不需要做session数据共享了。\r\n\r\n关键多台server的原因是为负载均衡而做的，那么就得把原来负载均衡的规则假设是—a，现在改为按照session来均衡分发请求的规则—b。\r\n\r\n \r\n\r\n如果这台机子挂掉了，那么后续的请求按照session的规则还是会分发到这台服务器上去，但是现在不可用了。\r\n\r\n本来负载均衡有一个目的就是：当其中一台机子不可用的时候，会自动分发到可用的机子上去(自动判断现在要请求的机子是否可用)\r\n\r\n \r\n\r\n因为某种规则的session都是保存在一台服务器上，比如用户编号是1-200涉及到的session数据保存到a服务器上去。所以只要一台出问题，1-200的用户就无法实现登录了。后面就不可用了(可能想到1-200用户的session服务器用多台进行复制，这感觉很蹩脚，仍然需要用到复制的话，还不如用其他简便的方法)\r\n\r\n \r\n\r\n第三种思路：做一个中间层，专门来存储所有访问涉及到的session。也就是所有的session都存储在这里。\r\n\r\n服务器端统一从这里读取session数据。\r\n\r\n \r\n\r\n具体实现方式很多种。我的理解是，这里只是一种思想层面上的。我不知道淘宝的tbsession框架的具体实现。但是大致思想差不多，\r\n\r\n由这个session框架来维护所有网站的session数据。我根据自己的理解，猜测淘宝的结构画图大致如下：\r\n\r\n \r\n\r\n使用这种中间层的思想来实现共享，具体的技术方案，我归纳为以下几种：\r\n\r\n \r\n\r\n1、 通过NFS文件共享的方式，多台php服务器共享保存session文件的磁盘。\r\n\r\n通过nfs的方式，各个php服务器操作session数据的时候，是读取本地磁盘目录，但实际上是一个共享网络文件。各个php服务器实际上操作的都是同一个目录的文件。\r\n\r\n \r\n\r\n具体的操作细节。到时候还需要详细写一下。我根据理解，画了下面的图：\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n　2、保存在数据库中，这种方式的扩展性很强，可以随意增加WEB而不受影响。放在数据库里面安全方面好。\r\n\r\n \r\n\r\n其实我理解本质是：自己写程序(php,java都可以实现，反正是保存在数据库中)模拟实现session的机制。\r\n\r\n \r\n\r\n具体为，把以前存储在文件中的session数据存储到数据库中去，那么这样做，其实就不用到php内置的session机制了(像session_start()之类的函数都不需要去用了)。\r\n\r\n写程序要模拟的是，从数据库拿session数据，约定什么情况下数据过期了然后自动清理，这里是指删除数据库中的行。保存在文件中的时候，php有垃圾回收机制会去自动清理过期的session文件。\r\n\r\n====================================弊端\r\n\r\n \r\n\r\n放在数据库里面，访问量小没有问题。大流量网站这么做，只会拖慢速度。因为得查询数据库，造成数据库压力大。\r\n\r\n高并发访问的情况下,会出现很大的性能问题。\r\n\r\n有些做法跟这种思想是类似的：比如ecshop、phpcms是把session数据都存储在数据库中去。服务端就是从数据库中拿session的数据。\r\n\r\n放到数据库存储后，就可以实现：多台web服务器统一操作数据库，因为数据都在数据库，web服务器都能从数据库进行读取，那么session数据就能实现共享。\r\n\r\n存储在数据库的做法，在线人数决定了其瓶颈，主要问题是影响性能。在线人数,因为登录的session数据存储在数据库中，只要是登录的用户就会涉及到频繁操作数据库。\r\n\r\n我觉得小网站，同时1-2万个人在线情况下。应该没什么问题。\r\n\r\n看网上丢出一个问题：对于大访问量的网站，数据库存储session方法可行性有待商榷。\r\n\r\n \r\n\r\n我搜寻了一些资料，理解如下：\r\n\r\n访问量大的话，一个用户访问了n多个页面，哪怕是刷新页面，都需要去数据库取session数据。数据库的承受压力，确实很恐怖。pv是多少，就要请求多少次数据库服务器。\r\n\r\n \r\n\r\n访问每个页面都会去数据库查询是否登录，或者添加数据进数据库的sessions表\r\n\r\n \r\n\r\n保存在文件中的时候，则交给了操作系统去控制。一个用户怎么刷新页面，查看其他页面，都只需要读取单个session文件(sess_74dd7807n2mfml49a1i12hkc45)。\r\n\r\n我觉得，ecshop,discuz之类的系统之所以把session存储在数据库中去，跟网站的应用级别有关。他们设计的系统本身就是给中小站长用的，这些中小站长一般由于规模小，经济成本考虑，使用的是虚拟主机之类的。不具备对服务器的完全控制权限，比如还要安个memcache之类的,修改php.ini之类的都需要自己拥有独立服务器才能操控的(vps也算,只是虚拟出来的硬件而已)。\r\n\r\n其实真正要做到网站大了，系统承受不住了。也会自己有独立的技术人员可以进行二次开发。\r\n\r\n \r\n\r\ndiscuz这些做通用的软件要考虑思路有个特点：得考虑大部分用户的服务器环境。比如经常看到源代码里面要做php版本判断的代码，判断是5.0之前的要如何处理，以求尽量适应大部分环境。而我们公司自己运营的内部系统，环境我们完全可控。做这些确实是多余的工作量。\r\n\r\n另外一个点是，这些通用软件不会为了高级用户的特殊需求，做一些改变，结果另外一部分用户就无法使用了。没法两全。所以我的理解是，他们一般不会随便去响应站长的需求，比如你明明是一个很大用户的站点，你用了我的系统，还要说数据量大了承受不住，表容易损坏。你都达到某种级别的应用了，还不自己进行开发。来这里抱怨。找我按照你们方式定制，愿意给钱就好。\r\n\r\n \r\n\r\n从这里我看到，不是说这些软件技术含量就多好，是多么成熟的解决方案。他们针对的用户群不同。\r\n\r\n由于http是短连接，每次过程是：建立连接(握手)》》数据通信》》通信结束后结束连接。如果频繁的这样子连接后再断开，性能会非常差。\r\n\r\nsession存储在数据库中，有多少pv，就要多少次这样的数据库连接操作(得去数据库拿session才能知道有没有登录，登录是否过时)。\r\n\r\n \r\n\r\n3、可以将session数据保存在memcached，redis之类内存数据库中，memcached是基于内存存储数据的，性能很高，用户并发量很大的时候尤其合适。\r\n\r\n主要是利用内存的数据读取速度是很快的，与磁盘读取的速度不是一个数量级的。\r\n\r\n使用内存存储：方便统计在线人数，内存的速度比磁盘访问快、内存数据库系统能够控制内存中的过期数据自动失效(刚好符合session过期需要)。\r\n\r\n \r\n\r\n存储在redis比较理想的选择，存储在数据库中方便存储统计在线人数，那么存储在redis中也实现了这个要求。\r\n\r\n也可以存储在memcache中。但redis支持的数据类型多。所以用它好点。\r\n\r\n \r\n\r\n关于使用技术工具复制session数据同步到多台服务器的方案权衡：\r\n\r\n这种方案是，使用一些文件同步工具(linux下的rsync)，当a服务器中的session数据有更改的时候，就会把这些更改也同步到b，c服务器上去。通过复制的方式，最终a，b，c各个服务器上都拷贝了一份session数据。\r\n\r\n这种方式的弊端是，速度慢。复制数据会出现延迟。比如第一秒访问是a服务器，修改了session数据，负载均衡，可能下一秒访问是b服务器，session数据如果没有被复制到b服务器，则是读取不到session数据的，出现时间上的延迟。这种复制数据要消耗很多网络带宽的。在实际中业界用得比较少。机器的数量越多，复制数据的性能损耗越大。不具备高度扩展性。\r\n\r\n复制session的方式，无论是网络带宽成本还是硬件开销上都很大的。\r\n\r\n \r\n\r\n =================================结束\r\n\r\n我写这篇总结文章的目的，只是为了梳理知识，完善自己的知识库。不一定正确。其中有些方式我确实没试过，也没有100%搞清楚细节。所以不一定完全正确。\r\n\r\n有不当之处，期待后续完善，欢迎指正。', 'artpop', '2015-05-17 10:41:31', 0);
INSERT INTO `post` (`id`, `title`, `content`, `writer`, `time`, `commentNum`) VALUES
(10, 'session原理总结[转]', '之前在学校的时候，只知道session与cookie的区别在于：session是保存在服务器端，cookie保存在客户端。session怎么样保存的？以文件的形式保存。自己去测试过。有的忘记了。对应session的id号模糊不清。在开发中，非常有必要弄明白具体细节。不能停留在使用session_start()函数了，然后获取session值。不知道里面的机制，在开发中遇到了新的问题，解决起来比较费心。\r\n\r\n一、session是怎么保存的？怎么去查看其内容？\r\n\r\nsession是以文件的形式保存的。php.ini中有个配置项--session.save_path= "";这个里面填写的路径，将会使session文件保存在该路径下。session文件的命名格式是："sess_[PHPSESSID的值]"。每一个文件，里面保存了一个会话的数据。其实只要使用代码$_SESSION[''user_id''] = $value;就会促发php的session机制，结果往对应的session文件中写入一个值。\r\n\r\n二、session.save_path路径下这么多的session文件，php是如何确定要调用哪个session文件的？\r\n\r\nphp是依据，一个名为PHPSESSID的cookie，根据它的值，确定要调用哪个session文件的。去浏览器中，可以看到一个cookie名为PHPSESSID，假如它的值为"sess_adbjsf2q1ass26oootd163sf84"，那么，当访问服务器的时候，就会调用session目录下名为"sess_sess_adbjsf2q1ass26oootd163sf84"的文件。其实，PHPSESSID就是一个会话id，以此来确定，哪个是你的会话数据。\r\n\r\n以下是在浏览器查看cookie所看到的\r\n\r\n \r\n\r\ncookie的名字PHPSESSID是可以改的，在php.ini中 session.name = PHPSESSID就是设置该cookie的名字。\r\n\r\n结合自己实际开发中遇到的问题，总结一下：要说session跟cookie有关联的地方，就是跟PHPSESSID这个cookie有绑定关系。其他，不管你设置什么cookie，使用session的时候是不会用到这些值的。也无法获取到。比如同步登陆，设置即使设置了cookie，而你的应用是依据session判断是否为登陆状态的(事实上也必须如此，因为session保存在服务器端，安全性更高，哪个依据cookie认为你已经登陆，那么很惨)。\r\n\r\n所以，这样的情况就会出现，即使成功设置了cookie。也还是不能同步登陆。\r\n\r\n \r\n\r\n三、经常遇到的现象：为什么删除一个session文件，之后生成一个session文件，新的文件名字还是与原来一样？\r\n\r\n理解到session文件的命名规则是：“sess_PHPSESSID值“。那么，就很容易明白了。因为，客户端存在cookie：PHPSESSID。客户端发送请求后，会将该cookie发送给服务器(php可以使用$_COOKIE[''PHPSESSID'']看到其内容)，这样的话，还是会根据PHPSESSID生成一个session文件的。\r\n\r\n四、如何查看session文件中的session值？\r\n\r\n我在开发中发现，如果仅仅依靠session_start()和$_SESSION[''user_id'']这样的代码，去调试，还不够全面的了解问题所在。比如，我想知道，session_start()到底在完成哪些操作？如果，想动态，实时知道session的值是如何被改写的，打开一个session文件，查看是很了然的。原来，里面就是保存的是一些被序列化后的值。也明白一个知识点，"php圣经"中讲解session的时候，提到session值做被序列化了。下面看到的session内容就是被序列化了。\r\n\r\n打开一个session文件，内容如下：\r\n\r\ncityID|i:0;cityName|s:3:"all";fanwe_lang|s:5:"zh-cn";fanwe_currency|a:4:{s:2:"id";s:1:"1";s:6:"name_1";s:9:"人民币";s:4:"unit";s:3:"￥";s:5:"radio";s:6:"1.0000";}_fanwe_hash__|s:32:"77c18770c6cb5d89444c407aaa3e8477";\r\n\r\n \r\n\r\n \r\n\r\n总结出读取规则：\r\n\r\n1、每一个session的值是以分号";"分开的。比如“cityID|i:0;cityName|s:3:"all";”就是一个完整的session值结束\r\n\r\n2、里面的读取规则：符号“|”前面表示session名称。符号后面是该session的具体信息。包括：数据类型，字符长度，内容。上面第一个就相当于使用如下php代码访问:$_SESSION[''cityID'']\r\n\r\n \r\n\r\n后面的s表示数据值的长度，3表示字符长度。比如这一段：fanwe_lang|s:5:"zh-cn";  fanwe_lang是变量的名称，变量值是"zh-cn",长度刚好是5，就是”s:5“标明的。\r\n\r\n最后"all"就表示session的具体值了。就是使用代码$_SESSION[''cityID'']后会得到的结果。\r\n\r\n \r\n\r\n3.一个session可以保存一个数组。符号{}表示数组的内容。上面的花括号{}是$_SESSION[''fanwe_currency'']所保存的内容。要想查看id的值，就使用代码：$_SESSION[''fanwe_currency''][''id'']\r\n\r\n \r\n\r\n五、怎么样理解session_start等函数所做的实际操作是什么？\r\n\r\n \r\n\r\n我是这样理解的：session_start，可以看成是创建一个session文件。假如有原来的session文件，或许没有创建。引入一个。往session文件中写值，那是代码“$_SESSION['''']=" ";  赋值所完成的操作。\r\nsession_start()生成一个新的session文件名时。会判断是否存在cookie名为PHPSESSID的值。如果存在，那么就会按照它的值，组合成一个文件名"sess_[phpcookie值]"。所以，在目录下，老是能够看到之前删除过的session文件名。如果将浏览器中对应的cookie(PHPSESSID)删掉。那么就不会生成同样的名字了。如果不存在名为PHPSESSID的cookie。php所做的估计为：先发送一个cookie，然后按照cookie的值生成一个(我可以在浏览器中马上看到一个名为PHPSESSID的cookie)\r\n\r\n其实，现在也更加深刻地理解了一个知识：在调用session_start()之前不能有任何输出。有输出就会报错。\r\n\r\nsession_start()已经封装了发送cookie的操作(发送一个名称为PHPSESSID的cookie到浏览器)。涉及到http的一个原理:头部信息必须在内容之前发送才行。所以，使用echo ''内容'';\r\n\r\nheader(''Content-type: text/xml; charset=gb2312'');//头部信息，不算内容\r\n\r\n可以这样认为：session_start()内部已经进行了一次发送头部动作。所以之前不能有任何输出内容。\r\n手册中的英文大致是这样说的：创建一个session，或者恢复当前一个session(基于request请求传递的session id,这里应该值的就是http请求时传递的名为PHPSESSID的cookie)\r\n\r\n \r\n\r\n实际开发应用总结：\r\n\r\n只要是同一个用户的操作。导航程序访问记录和团购程序访问的记录都是保存在同一个session文件中\r\n\r\n如果是不同的域呢？假如用户访问cs.test.com和daohang.test.com，两方程序都设置了session。那么session的结果保存在同一个session文件中吗？\r\n\r\n因为：服务器是统一管理session文件的存放的。而php引擎是根据phpsessionid的值确定要操作哪个session文件。session\r\n\r\n文件名的格式是："sess_[phpcookie值]"。依次寻找对应的session文件(于是在浏览器查看名为PHPSESSIONID的cookie，过期时间是在会话结束后)\r\n所以，只要cs.test.com和daohang.test.com使用的是同一台服务器。\r\n这样的话，假如是多台服务器的情况。那么就不得不将session保存在数据库中去。这样实现session共享。跟具体的服务器是无关的。\r\n\r\n \r\n\r\n（2013年更新：实际上共享session不局限于数据库中保存，关于session共享方案，根据自己的理解一年后写了一篇总结文章，http://www.cnblogs.com/wangtao_20/p/3395518.html）\r\n\r\nsession文件是某个用户整个会话过程中数据。那么，假如cs.test.com和daohang.test.com下的两个程序运行在同一个服务器上。就意味着，访问cs.test.com与访问daohang.test.com是同一个会话。也就意味着，这两边访问后设置的session数据是保存在同一个session文件中的。\r\n\r\n可以将名为PHPSESSIONID的cookie，其值看成是一个会话的id。会话结束后，该cookie过期或者被删。那么，服务器对应的session文件(名为"sess_[phpcookie值]")会被删掉吗？查看发现并不会被删掉。所以才会有session文件很多，出现读取性能的问题。session文件比较多的情况下，产生I/Q读写性能问题。了解到可以将session文件分多个目录保存(参考http://www.jb51.net/article/27941.htm)。php.ini中的配置项session.save_path,前面一个值M可以指定目录的深度级别。这个没测试过。需要用到的时候，再去测试一下。\r\n\r\n待解决疑问\r\n\r\n一、session的过期时间是怎么确定的？\r\n查看session文件内容，发现里面有个值设置了session文件的过期时间：__HTTP_Session_Expire_TS|i:1297750868;\r\n\r\n已掌握的信息：\r\nPHPSESSID该cookie的过期时间在浏览器中显示：会话结束后过期\r\n\r\n所有的session文件没有被自动删掉，只是有个过期时间，以此决定：是新生成一个session文件还是使用原来的。\r\n\r\n原来：服务器定期session清理机制估计会用到这个东西\r\n\r\n二、如果没有设置php.ini中的参数。php默认会将session文件保存到什么位置？\r\n\r\n附网文：php.ini中配置session参数的说明。\r\n\r\n【Session】\r\n\r\n \r\n\r\n[服务端]\r\n\r\nsession.save_handler = files\r\n\r\n默认为file，定义session在服务端的保存方式，file意为把sesion保存到一个临时文件里，如果我们想自定义别的方式保存\r\n\r\n（比如用数据库），则需要把该项设置为user；\r\n\r\n \r\n\r\nsession.save_path = "D:/APMServ5.2.0/PHP/sessiondata/"\r\n\r\n定义服务端存储session的临时文件的位置。\r\n\r\n \r\n\r\nsession.auto_start = 0\r\n\r\n如置1，则不用在每个文件里写session_start(); session自动start ：）\r\n\r\n \r\n\r\nsession.gc_probability = 1\r\n\r\nsession.gc_divisor    = 100\r\n\r\nsession.gc_maxlifetime = 1440\r\n\r\n这三个配置组合构建服务端session的垃圾回收机制\r\n\r\nsession.gc_probability与session.gc_divisor构成执行session清理的概率，理论上的解释为服务端定期有一定的概率调用gc函数来对session进行清理，清理的概率为：gc_probability/gc_divisor 比如：1/100  表示每一个新会话初始化时，有\r\n\r\n1%的概率会启动垃圾回收程序，清理的标准为session.gc_maxlifetime定义的时间。\r\n\r\n \r\n\r\n[客户端]\r\n\r\nsession.use_cookies = 1\r\n\r\nsessionid在客户端采用的存储方式，置1代表使用cookie记录客户端的sessionid，同时，$_COOKIE变量里才会有$_COOKIE[\r\n\r\n‘PHPSESSIONID’]这个元素存在；\r\n\r\n \r\n\r\nsession.use_only_cookies = 1\r\n\r\n也是定义sessionid在客户端采用的存储方式，置1代表仅仅使用 cookie 来存放会话 ID。一般来说，现在客户端都会支持\r\n\r\ncookie，所以建议设置成1，这样可以防止有关通过 URL 传递会话 ID 的攻击。\r\n\r\n \r\n\r\nsession.use_trans_sid = 0\r\n\r\n相对应于上面那个设置，这里如果置1，则代表允许sessionid通过url参数传递，同理，建议设置成0；\r\n\r\n \r\n\r\nsession.referer_check = \r\n\r\n这个设置在session.use_trans_sid = 1的时候才会生效，目的是检查HTTP头中的"Referer"以判断包含于URL中的会话id是否\r\n\r\n有效，HTTP_REFERER必须包含这个参数指定的字符串，否则URL中的会话id将被视为无效。所以一般默认为空，即不检查。 \r\n\r\n \r\n\r\nsession.name = PHPSESSID\r\n\r\n定义sessionid的名称，即变量名，所以通过浏览器http工具看到的http头文件里的PHPSESSID=##############；\r\n\r\n \r\n\r\nsession.hash_function = 0\r\n\r\n选择session_name的加密方式，0代表md5加密，1代表sha1加密，默认是0，但是据说用sha1方式加密，安全性更高；\r\n\r\n \r\n\r\nsession.hash_bits_per_character = 4\r\n\r\n指定在session_name字符串中的每个字符内保存多少位二进制数，这些二进制数是hash函数的运算结果。\r\n\r\n4   bits:   0-9,   a-f \r\n\r\n5   bits:   0-9,   a-v \r\n\r\n6   bits:   0-9,   a-z,   A-Z,   "-",   ","\r\n\r\n \r\n\r\nurl_rewriter.tags = "a=href,area=href,frame=src,input=src,form=,fieldset="\r\n\r\n指定重写哪些HTML标签来包含sid(session_id)（仅在"session.use_trans_sid"打开的情况下有效），URL重写器将添加一个\r\n\r\n隐藏的"<input>"，它包含了本应当额外追加到URL上的信息。 \r\n\r\n \r\n\r\nsession.cookie_lifetime = 0\r\n\r\n保存sessionid的cookie文件的生命周期，如置0，代表会话结束，则sessionid就自动消失，常见的强行关闭浏览器，就会丢\r\n\r\n失上一次的sessionid；\r\n\r\n \r\n\r\nsession.cookie_path = /\r\n\r\n保存sessionid的cookie文件在客户端的位置；\r\n\r\n \r\n\r\nsession.cookie_domain = /\r\n\r\n保存sessionid的cookie的域名设置，这跟cookie允许的域名的访问权限设置有关，一般来说想让自己网站所有的目录都能访\r\n\r\n问到客户端的cookie，就应该设置成“/”如需要详细了解，可以看下setcookie()函数的domain参数相关设置和使用方法；\r\n\r\n \r\n\r\nsession.bug_compat_42 = 1\r\n\r\nsession.bug_compat_warn = 1\r\n\r\n这两个可以说几乎是快要被废弃的设置，是为了老版本的php服务的，主要是针对 session_register函数，因为php5的\r\n\r\nregister_global默认是关闭状态，所以在php5里根本用不到 session_register这个函数；并且php6就要废除这个设置，直\r\n\r\n接定义为关闭，所以没必要研究这两个了；', 'artpop', '2015-05-17 10:43:34', 0),
(11, 'nihao', 'dsfd ', 'cheekTocheek', '2015-05-28 11:19:42', 0),
(12, 'hahah', '\r\nartpop: 你好 2015-05-17 16:45:48\r\ntheFame: 你也好 2015-05-17 22:54:54\r\nartpop: 答辩v 2015-05-18 13:43:46\r\ntheFame: 今天不开心了 2015-05-18 19:46:09\r\ntheFame: 我又来了 2015-05-18 19:52:10\r\ntheFame: 现在可以聊天了吗？ 2015-05-18 14:00:27\r\nartpop: 可以ａ　 2015-05-18 14:00:44\r\nartpop: 今天很开心了 2015-05-18 14:01:51\r\ntheFame: 我也是 2015-05-18 14:02:08\r\nartpop: nihao a  2015-06-23 17:55:04\r\nartpop: haha 2015-06-28 23:37:52\r\n*******以上为历史消息*******', 'artpop', '2015-06-28 23:40:49', 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(9, 'artpop', 'artpop', 'artpop@hotmail.com'),
(12, 'cheekTocheek', 'artpop', '875733487@qq.com'),
(13, 'theFame', 'artpop', '123324324@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `usermessage`
--

CREATE TABLE IF NOT EXISTS `usermessage` (
  `id` int(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `realname` varchar(100) NOT NULL,
  `sex` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `introduce` varchar(200) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `wechat` varchar(30) NOT NULL,
  `weibo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `usermessage`
--

INSERT INTO `usermessage` (`id`, `username`, `realname`, `sex`, `birthday`, `introduce`, `phone`, `wechat`, `weibo`) VALUES
(1, 'artpop', '林圣煌', '男', '1994-11-21', 'HELLO WORLD', '', '', ''),
(2, 'cheekTocheek', '', '', '0000-00-00', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
