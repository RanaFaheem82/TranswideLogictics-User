//
//  MainContainerViewController.swift
//  CabIOS
//
//  Created by Ghafar Tanveer on 06/02/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
//Top bar delegate
protocol TopBarDelegate:NSObjectProtocol {
    func actionCallBackMoveBack()
}

class MainContainerViewController: BaseViewController {
  
    @IBOutlet weak var topBarHeight : NSLayoutConstraint!
    @IBOutlet weak var viewContainer : UIView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var btnMenu : UIButton!
    @IBOutlet weak var btnReward : UIButton!
   
    var basenavController: BaseNavigationController?
    var delegate:TopBarDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
         self.showHomeController()
    }
   
    func setTitle(title:String) {
        self.lblTitle.text = title
    }
    func setbackgroundColor(color:UIColor)  {
        //self.viewBackground.backgroundColor = color
    }
    
    func switchRightButtonVisibility() {
        btnReward.isHidden = !btnReward.isHidden
    }
    
    @IBAction func actionSideMenu(_ sender: Any) {
          
          if let drawerController = navigationController?.parent as? KYDrawerController {
              drawerController.setDrawerState(.opened, animated: true)
          }
          
      }
      
    func setMenuButton(isBack:Bool = false)  {
           if(isBack){
               self.btnMenu.removeTarget(nil, action: nil, for: .allEvents)
               self.btnMenu.setImage(UIImage(named: "back-arrow")!, for: .normal)
               self.btnMenu.addTarget(self, action: #selector(MainContainerViewController.actionBack(_:)), for: .touchUpInside)
           }else{
              self.btnMenu.setImage(UIImage(named: "sidemenu")!, for: .normal)
               self.btnMenu.addTarget(self, action: #selector(actionSideMenu(_:)), for: .touchUpInside)
           }
       }
    //MARK:- FUNCTIONS
    func showHomeController()  {
        if  let oldRef = self.basenavController{
            oldRef.viewDidDisappear(true)
            oldRef.view.removeFromSuperview()
        }
        let storyBoard = UIStoryboard(name: StoryboardNames.Main, bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: NavigationIdentifier.LocationVC) as! BaseNavigationController
        addChild(controller)
        
        self.basenavController = controller
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    func showMyShipmentVCController()  {
          if  let oldRef = self.basenavController{
              oldRef.viewDidDisappear(true)
              oldRef.view.removeFromSuperview()
          }
          let storyBoard = UIStoryboard(name: StoryboardNames.Main, bundle: nil)
          var controller = BaseNavigationController()
          controller = storyBoard.instantiateViewController(withIdentifier: NavigationIdentifier.MyShipmentVC) as! BaseNavigationController
          addChild(controller)
          
          self.basenavController = controller
          controller.view.frame = self.viewContainer.bounds
          self.viewContainer.addSubview(controller.view)
          controller.didMove(toParent: self)
      }
    
       func logoutUser()  {
           
           Global.shared.user = nil
           Global.shared.isLogedIn = false
           UserDefaultsManager.shared.clearUserData()
           let storyboard = UIStoryboard(name: StoryboardNames.Registration, bundle: nil)
           let controller = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as! LoginViewController
           if let container = self.navigationController?.parent as? KYDrawerController {
               container.navigationController?.setViewControllers([controller], animated: true)
               container.navigationController?.popToRootViewController(animated: true)
           }
       }
    
    
    
    
    
    
  
    
    
  
    
//    func showNotificationController(isFromFCM: Bool? = false)  {
//        let storyBoard = UIStoryboard(name: StoryboardNames.Notification, bundle: nil)
//        var controller = BaseNavigationController()
//        controller = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.NotificationNavigationController) as! BaseNavigationController
//        if let vc = controller.topViewController as? NotificationListViewController{
//            vc.isFromNotification = isFromFCM!
//        }
//        addChild(controller)
//        if  let oldRef = self.basenavController{
//            oldRef.viewDidDisappear(true)
//            oldRef.view.removeFromSuperview()
//        }
//        controller.view.frame = self.viewContainer.bounds
//        self.viewContainer.addSubview(controller.view)
//        controller.didMove(toParent: self)
//    }
//
    
   
//    func logoutUser()  {
//        
//        UserDefaults.standard.set(nil, forKey: USER)
//        UserDefaults.standard.set(false, forKey: KEEP_LOGIN)
//        UserDefaults.standard.synchronize()
////        let storyboard = UIStoryboard(name: StoryboardNames.Registration, bundle: nil)
////        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as? LoginViewController{
////            self.navigationController?.pushViewController(vc, animated: true)
////        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    
    
    @IBAction func actionBack(_ sender:UIButton){
        if let del = self.delegate {
            del.actionCallBackMoveBack()
        }
        
    }
   
}
