//
//  BaseViewController.swift
//  AlKadi
//
//  Created by Khurram Bilal Nawaz on 22/07/2016.
//  Copyright © 2016 Khurram Bilal Nawaz. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import MBProgressHUD
import CoreLocation
import Cosmos
extension UIViewController{

    var mainContainer : MainContainerViewController? {

        
        get{
            var foundController: MainContainerViewController? = nil
            var currentViewController : UIViewController? = self

            if(self.isKind(of: MainContainerViewController.self)){
                foundController = (self as! MainContainerViewController)
            }else{
                while true{
                    if let parent = currentViewController?.parent {
                        if parent.isKind(of: MainContainerViewController.self){
                            foundController = (parent as! MainContainerViewController)
                            break
                        }else if parent.isKind(of: BaseNavigationController.self){
                            let navController = parent as! BaseNavigationController
                            if let parentController = navController.view.superview?.parentViewController{
                                if parentController.isKind(of: MainContainerViewController.self){
                                    foundController = (parentController as! MainContainerViewController)
                                    break
                                }
                            }
                        }

                    }
                    else {
                        break
                    }
                    currentViewController = currentViewController?.parent
                }
            }

            return foundController
        }
    }

}


public class BaseViewController : UIViewController,SWRevealViewControllerDelegate,UIGestureRecognizerDelegate {
    
    var hud = MBProgressHUD()
    
    var disableMenuGesture: Bool = false
    var objAlertVC:BaseViewController?
    var datePickerView: UIDatePicker = UIDatePicker()
    var locationManager:CLLocationManager!
   
    var alertView = CustomIOSAlertView()
    var popupAlertView = CustomIOSAlertView()
    override public func viewDidLoad() {
        super.viewDidLoad()
       
       
        
    }
   
    func showAlertVIew(message:String, title:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            //self.closeAlertMessage()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//           tap.cancelsTouchesInView = false
//           view.addGestureRecognizer(tap)
//       }
//
//       @objc private func dismissKeyboard() {
//           view.endEditing(true)
//       }
    func addTapGesture()  {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    public func revealControllerPanGestureShouldBegin(_ revealController: SWRevealViewController!) -> Bool {
        return false
    }
    func getUrl(lat: Double, lng : Double) -> String{
           let url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(lat),\(lng)&key=\("AIzaSyBTfypSbx_zNMhWSBXMTA2BJBMQO7_9_T8")"
           return url
       }
    func addSideMenu(button:UIButton)  {
        if revealViewController() != nil {
            revealViewController().panGestureRecognizer()
            revealViewController().tapGestureRecognizer()
            
            if(DeviceType.IS_IPHONE_5){
                revealViewController().rearViewRevealWidth = ScreenSize.SCREEN_WIDTH - 80
            }else{
                revealViewController().rearViewRevealWidth = ScreenSize.SCREEN_WIDTH - 120
            }
            revealViewController().delegate = self
            button.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
        }
    }

    func archiveUserObject(user:UserViewModel,isloggedIn:Bool? = false)  {
        Global.shared.user = user
        Global.shared.isLogedIn = isloggedIn!
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(encodedData, forKey: USER)
        UserDefaults.standard.set(isloggedIn!, forKey: KEEP_LOGIN)
        UserDefaults.standard.synchronize()
    }
  
  
    
    func showLocationPermissionPopup() {
        let alert = UIAlertController(title: LocationService.ServiceOff, message: LocationService.AllowLocationMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LocationService.Settings, style: .default, handler: { (action) in
            let settingUrl = URL(string: UIApplication.openSettingsURLString)!
            if let _ = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(settingUrl) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(settingUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    } else {
                        UIApplication.shared.openURL(settingUrl)
                    }
                }
            }
            
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
  
    func languageUpdated(){
        
    }
    
    func actionNextOnContainer(){
        
    }
    
    func actionPreviousOnContainer(){
        
    }
    
    func actionSubmitOnContainer(){
        
    }
    
    func actionCloseOnContainer(){
        
    }
    
    func addShadowOnView(view:UIView,color:UIColor,radius:Int,opacity:Float? = 1) {
        //view.center = self.view.center
        view.layer.shadowOpacity = opacity!
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = CGFloat(radius)
        //self.view.addSubview(view)
    }
    func setBorderColor(view:UIView,color:UIColor? = .white, width:CGFloat? = 1) {
        view.layer.borderWidth = width!
        view.layer.borderColor = color!.cgColor
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = EMAIL_REGULAR_EXPRESSION
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr.trimmingCharacters(in: .whitespaces))
    }
    
    
    
    func stopActivity (containerView: UIView? = nil) {
        if let v = containerView{
            MBProgressHUD.hide(for: v, animated: true)
        }else{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
//    func stopActivity (containerView: UIView? = nil) {
//        if let _ = containerView{
//            MKProgress.hide()
//        }else{
//            MKProgress.hide()
//        }
//    }
//    
    func startActivityWithMessage (msg:String, detailMsg: String = "") {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated:true)
//        hud.color = UIColor.gray
//        hud.activityIndicatorColor = UIColor.white
//        self.hud.labelText = msg
//        self.hud.detailsLabelText = detailMsg
    }
//    func startActivityWithMessage (msg:String, detailMsg: String = "") {
//        MKProgress.show()
//    }

 
//    func startActivityInView(view: UIView) {
//        self.hud = MBProgressHUD.showAdded(to: view, animated:true)
//        self.hud.layoutSubviews()
//    }
//
 
    //Mark:-designButton
    func designButton(button: UIButton, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor?.cgColor
    }
    //Mark:-designTextFiled
    func designTextField(textField: UITextField, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor?.cgColor
    }
    //Mark:-designTextView
    func designTextView(textview: UITextView, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        textview.layer.cornerRadius = cornerRadius
        textview.layer.borderWidth = borderWidth
        textview.layer.borderColor = borderColor?.cgColor
    }
    
    
    //Mark:-SetImageWithUrl
    func setImageWithUrl(imageView:UIImageView,url:String, placeholder:String? = "AppLogo"){
        let finalUrl = url.replacingOccurrences(of: " ", with: "%20")
        if let imageurl =  NSURL.init(string: finalUrl){
            imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            //imageView.sd_setShowActivityIndicatorView(true)
            imageView.sd_setImage(with: imageurl as URL?, placeholderImage: UIImage(named:placeholder!))
        }
    }
    
    func setPlaceholderTextColor(textfield:UITextField,text:String) {
        
        textfield.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.groupTableViewBackground])
        

    }
    func setPlaceholderBlackColor(textfield:UITextField){
        
        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder!,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
      
    }
    
    
    func setBorderColor(_ view:UIView,red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat, width: CGFloat? = 1) {
        
        view.layer.borderWidth = width!
        view.layer.borderColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha:alpha).cgColor
    }

    //MARK:-setToolbarOnPickerView
    func addToolBarToPickerView(textField:UITextField)
    {
        var buttonDone = UIBarButtonItem()
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let buttonflexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        //buttonDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Done, target:self, action:#selector(BaseViewController.doneClicked(_:)))
        
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(BaseViewController.doneClicked(_:)), for: .touchUpInside)
        //button.frame = CGRectMake(0, 0, 53, 31)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
      //  button.setTitleColor(UIColor(netHex: 0xAE2540), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.contentMode = UIView.ContentMode.right
        button.frame = CGRect(x:0, y:0, width:60, height:40)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        
        buttonDone = UIBarButtonItem(customView: button)
        
        
        toolbar.setItems(Array.init(arrayLiteral: buttonflexible,buttonDone), animated: true)
        textField.inputAccessoryView = toolbar
        
    }
    func addToolBarToPickerViewOnTextview(textview:UITextView)
    {
        var buttonDone = UIBarButtonItem()
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let buttonflexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        //buttonDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Done, target:self, action:#selector(BaseViewController.doneClicked(_:)))
        //buttonDone.title = "ye bat"
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(BaseViewController.doneClicked(_:)), for: .touchUpInside)
        //button.frame = CGRectMake(0, 0, 53, 31)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //button.setTitleColor(UIColor(netHex: 0xAE2540), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.contentMode = UIView.ContentMode.right
        button.frame = CGRect(x:0, y:0, width:60, height:40)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        
        buttonDone = UIBarButtonItem(customView: button)
        toolbar.setItems(Array.init(arrayLiteral: buttonflexible,buttonDone), animated: true)
        textview.inputAccessoryView = toolbar
        
    }
    override public func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing,animated:animated)
        if (self.isEditing) {
            self.editButtonItem.title = "Editing"
        }
        else {
            self.editButtonItem.title = "Not Editing"
        }
    }
    
//    public func revealControllerPanGestureShouldBegin(_ revealController: SWRevealViewController!) -> Bool {
//        if Global.shared.disableMenuGesture! {
//            return false
//        }
//        return true
//    }
    @IBAction func doneClicked(_ sender:AnyObject)
    {
        self.hideKeyboard()
    }
    func hideKeyboard() {
       // self.dismissKeyboard(self)
        self.view.endEditing(true)
    }
    
//    func showAlertView(message:String, title:String, doneButtonTitle:String, doneButtonCompletion: ((UIAlertAction) -> Void)?) {
//        showAlertView(message: message, title: title, doneButtonTitle: doneButtonTitle, doneButtonCompletion: doneButtonCompletion, cancelButtonTitle: "Cancel", cancelButtonCompletion: nil)
//    }
  func showAlertView(message:String, title:String, doneButtonTitle:String, doneButtonCompletion: ((UIAlertAction) -> Void)?) {
           showAlertView(message: message, title: title, doneButtonTitle: doneButtonTitle, doneButtonCompletion: doneButtonCompletion, cancelButtonTitle: nil, cancelButtonCompletion: nil)
       }
       
       func showAlertView(message:String, title:String, doneButtonTitle:String = "OK", doneButtonCompletion: ((UIAlertAction) -> Void)? = nil, cancelButtonTitle:String? = nil, cancelButtonCompletion:((UIAlertAction) -> Void)? = nil) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           let okAction = UIAlertAction(title: doneButtonTitle, style: .default, handler: doneButtonCompletion)
           if let cancelTitle = cancelButtonTitle {
               let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelButtonCompletion)
               alertController.addAction(cancelAction)
           }
           alertController.addAction(okAction)
           self.present(alertController, animated: true, completion: nil)
           
       }
    func showAlertView(message:String, title:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            //self.closeAlertMessage()
        }

        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
   
    func checkInternetConnection() -> Bool {
        if(BReachability.isConnectedToNetwork()){
            return true
        }else{
            self.showAlertView(message:ERROR_NO_NETWORK, title: "Alert")
            return false
        }
    }
    
    
    // Resend Message Popup Delegate
    func actionCallBackResend() {
        
    }
    // Get Profile Data and navigate to Profile Detail Screen
  }

