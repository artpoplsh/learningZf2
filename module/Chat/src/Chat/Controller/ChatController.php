<?php 
namespace Album\Controller;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
class AlbumController extends AbstractActionController{
    protected $albumTable;
    public function indexAction(){
        //echo "index";exit;
        return array(
             'albums' => $this->getAlbumTable()->fetchAll(),
         );
    }
    public function addAction()
    {
        exit("add");
    }
    
    public function editAction()
    {
        exit("edit");
    }
    
    public function deleteAction()
    {
        exit("delete");
    }
    public function getAlbumTable()
    {
        
        if (!$this->albumTable) {
            $sm = $this->getServiceLocator();
            //echo "index";exit;
            $this->albumTable = $sm->get('Album\Model\AlbumTable');
            
        }
        return $this->albumTable;
    }
}