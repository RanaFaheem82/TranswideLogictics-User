import Foundation
import UIKit

class Global {
    class var shared : Global {
        
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    var deviceId:String = UIDevice.current.identifierForVendor!.uuidString
    
    var IPAddressInfo:IPAddressInfoViewModel?
    var user:UserViewModel?
    var signup:SignupViewModel? = SignupViewModel()
    var isLogedIn:Bool = false
    var FCMToken:String? = ""
    
    var fcmNotification:FCMNotificationViewModel?
    var isFromNotification:Bool = false
    var isFbLogin = false
    
    
  }

