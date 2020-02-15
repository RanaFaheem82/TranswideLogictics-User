import Foundation
import UIKit
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X_All = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 812 || ScreenSize.SCREEN_MAX_LENGTH == 896))
    static let IS_IPHONE_X = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 812))
    static let IS_IPHONE_X_MAX = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 896))
}

var TOP_BAR_HEIGHT:CGFloat = 54
var BOTTOM_BAR_HEIGHT:CGFloat = 65
var PROFILE_VIEW_HEIGHT:CGFloat = 270
let ANIMATION_TIME = 0.6
let VERIFICATION_TIME = 60



struct ApplicationColors {
    static let LightGrayColorWithAlpha = UIColor.hexStr("0x707070", alpha: 0.21)
    static let PinkColor = UIColor.hexStr("0xFF5D5D")
    static let DarkPinkColor = UIColor.hexStr("0xFF5F55")
    static let LightGrayColor = UIColor.hexStr("0xF9F9F9")
    static let YellowColor = UIColor.hexStr("0xFFC66C")
    static let BlackColor = UIColor.black
    
}




let PRINT_API_RESPONSE = false

let KEEP_LOGIN = "keepLogin"
let USER = "user"





let BASE_URL = "http://mashghol.com/hitch/public/api/"
let BASE_URL_LIVE = "http://144.91.68.79:9779/api/"

let BASE_URL_2 = "http://144.91.68.79:9779/api/"


let URL_REGISTER_USER              = "register"
let URL_LOGIN                      = "login"
let URL_FORGET_PASSWORD            = "user/password/forgot"
let URL_FCM_TOEKN_REGISTRATION     = "update_fcm_token"
let URL_GET_HOME_PRODUCTS          = "Home/GetHomeProducts"
let URL_ADD_COMMENT                = "add_comments"
let URL_GET_COMMENT                = "get_comment"
let URL_GET_ALL_CATEGORIES         = "add_comments"
//let URL_GET_HOME_PRODUCTS          = "Home/GetHomeProducts"
let URL_GET_PRODUCT_BY_CATEGORY    = "Product/GetProductsByCategoryId/"
let URL_GET_PRODUCT_BY_ID          = "Product/GetProductById/"
let URL_UPDATEPROFILE = "update_profile"
let URL_SOCIALLOGIN = "social_login"



