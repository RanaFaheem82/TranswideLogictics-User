
import Foundation
import UIKit

typealias ParamsAny = [String:Any]
typealias ParamsString = [String:String]
let TERMS_AND_CONDITION = "I agree to the Temrs & Conditions of User Agreement & Privacy Policy"

let FAILED_MESSAGE = "Failed Please Try Again!"
let FAILED = ""
let LOGIN_KEY = "login"
let EMAIL_REGULAR_EXPRESSION = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

let STRING_SUCCESS = ""
let STRING_UNEXPECTED_ERROR = ""
let TIMEOUT_MESSAGE = "Request Time out"
let ERROR_NO_NETWORK = "Connection lost. Please check your internet connection and try again."//"Internet connection is currently unavailable."

struct SideMenu {
    static let MENULIST = [["title":"","image":""],
                           ["title":"HOME","image":"IconHome"],
                           ["title":"Profile","image":"IconEditProfile"],
                           ["title":"Favourites","image":"IconReward"],
                           ["title":"Notifications","image":"IconHistory"],
                           ["title":"Privacy Policy","image":"IconPrivacyPolicy"],
                           ["title":"HELP","image":"IconHelp"],
                           ["title":"ABOUT US","image":"IconAboutUs"]]
}

struct ComplaintDetail {
    static let DETAIL_LIST = [["title":"","detail":""],["title":"COUNTRY","detail":"United Kingdom"],["title":"PROVINCE","detail":"Scotland"],["title":"CITY","detail":"Lahore"],["title":"","detail":""],["title":"CATEGORY","detail":"Municipal Service"],["title":"Compalint Details","detail":"Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."],["title":"COMPLAINT ADDRESS","detail":"M Block Model Town, Lahore, Pakistan"],["title":"","detail":""],["title":"","detail":""]]
    
}

struct NavigationIdentifier{
    static let LocationVC = "LocationVC"
}

struct ControllerIdentifier {
    
    static let KYDrawerController = "KYDrawerController"
    static let CommentsInputViewController = "CommentsInputViewController"
    static let CategoryViewController = "CategoryViewController"
    static let RevealNavigationController = "revealNavigation"
    static let SWRevealViewController = "SWRevealViewController"
    static let MainContainerViewController = "MainContainerViewController"
    static let SignupViewController = "SignupViewController"
    static let ForgetPasswordViewController = "ForgetPasswordViewController"
    static let LoginViewController = "LoginViewController"
    static let HomeViewController = "HomeViewController"
    static let MobileInfoViewController = "MobileInfoViewController"
    static let CodeValidationViewController = "CodeValidationViewController"
    static let HomeNavigationController = "HomeNavigationController"
    static let WebBrowserBaseNavigationController = "WebBrowserBaseNavigationController"
    static let LoginNavigationController = "LoginNavigationController"
    static let ProductListViewController = "ProductListViewController"
    static let PriceDetailsViewController = "PriceDetailsViewController"
    static let ProductDetailsViewController = "ProductDetailsViewController"
    static let CommentsPopUpViewController = "CommentsPopUpViewController"
    static let ProfileViewController = "ProfileViewController"
    
    
    
   
}
struct CellIdentifiers {
    static let MyBookingTableViewCell = "MyBookingTableViewCell"
    static let CommentsTableViewCell = "CommentsTableViewCell"
    static let CategoryViewCell = "CategoryViewCell"
    static let CategoryTableViewCell = "CategoryTableViewCell"
    static let HomeSliderTableViewCell = "homeSliderTableViewCell"
    static let NewArrivalsTableViewCell = "NewArrivalsTableViewCell"
    static let OtherOptionTableViewCell = "OtherOptionTableViewCell"
    static let SideMenuTableViewCell = "SideMenuTableViewCell"
    static let SideMenuProfileTableViewCell = "SideMenuProfileTableViewCell"
    static let CategoryCollectionViewCell = "CategoryCollectionViewCell"
    static let HomeSliderCollectionViewCell = "HomeSliderCollectionViewCell"
    static let NewArrivalsCollectionViewCell = "NewArrivalsCollectionViewCell"
    static let OtherOptionsCollectionViewCell = "OtherOptionsCollectionViewCell"
    static let ProductTableViewCell = "ProductTableViewCell"
    static let CategoryListingCollectionViewCell = "CategoryListingCollectionViewCell"
    
    
}

struct Assets {
    static let IconHeartSelected = "IconHeartSelected"
    static let IconCheersSelected = "IconCheersSelected"
    static let IconTwoHeartSelected = "IconTwoHeartSelected"
    static let IconHeartPinSelected = "IconHeartPinSelected"
    static let IconMultiHeartSelected = "IconMultiHeartSelected"
    
    static let IconCheerDefault = "IconCheerDefault"
    static let IconHeartPinDefault = "IconHeartPinDefault"
    static let IconMultiHeartDefault = "IconMultiHeartDefault"
    static let IconTwoHeartDefault = "IconTwoHeartDefault"
    static let iconFavourite = "iconFavourite"
    static let IconUnFavourite = "IconUnFavourite"
    
}


struct NavigationTitles {
   static let Home = "HOME"
    static let Products = "PRODUCTS"
    static let AddComplaints = "ADD EVIDENCE"
    static let Detail = "EVIDENCE DETAIL"
    static let Notifications = "Notifications"
    static let Withdraw = "Withdraw"
    static let PrivacyPolicy = "Privacy policy"
    static let Help = "Help"
    static let FAQS = "FAQ's"
    static let AboutUs = "About us"
    static let Rewards = "REWARDS"
    static let Category = "CATEGORIES"
    static let PriceHistory = "PRICE HISTORY"
    static let ProductDetail = "PRODUCT DETAIL"
    static let ProductList = "PRODUCT LIST"
    static let Profile = "PROFILE"
    
}

struct NotificationName {
   
}
struct PlaceHolders {
   static let profile = "product-display-icon"
    static let appLogo = "AppLogo"
}

struct NibNames {
    static let CategoryCollectionViewCell = "CategoryCollectionViewCell"
}
struct StoryboardNames {
    static let Main = "Main"
    static let Registration = "Registeration"
    static let Product = "Product"
    static let Complaint = "Complaint"
    static let Notification = "Notification"
    static let Reward = "Reward"
    static let WebBrowser = "WebBrowser"
    static let Profile = "Profile"

}

struct WebUrls {
    static let PRIVACY_POLLICY = "http://mashghol.com/whistleblower/public/privacy"
    static let HELP = "http://mashghol.com/whistleblower/public/help"
    static let ABOUT_US = "http://mashghol.com/whistleblower/public/about"
    static let FAQS = "http://mashghol.com/whistleblower/public/faq"
}
struct CameraService {
    static let title = "Camera Service Off"
    static let message = "Turn on Camera in Settings > Privacy to allow myLUMS to determine your Camera"
}

struct LocationService {
    static let ServiceOff = "Location Service Off"
    static let AllowLocationMessage = "Turn on Location in Settings > Privacy to allow myLUMS to determine your Location"
    static let Settings = "Settings"
}

   
struct AppMessages {
    static let FillAllFields = "Please fill all fields."
    static let FillEmailFields = "Please enter your email address."
    static let UsernameAndPasswordRequired = "Please enter your username and password to login."
    static let EmailRegistered = "Please enter your registered email to continue."
    static let EmailFormate = "Please enter valid email."
    static let PhoneFormate = "Please enter valid phone number."
    static let EmailSame = "Both emails must be same."
    static let PasswordSame = "Both passwords must be same."
    static let PasswordFormate = "Password must contain at least 5 characters"
    static let NewPasswordFormate = "New password must contain at least 5 characters"
    static let ConfirmPasswordFormate = "Confirm password must contain at least 5 characters"
    static let PasswordRequired = "Please enter password."
    static let TermsAndCondition = "Please check Terms and Conditions"
    static let UpdateProfileRequired = "Please fill fields to update"
    static let AddressFieldLimit = "Please enter valid address."
    static let AddAttachment = "Please add attachment."
    static let DetailFieldLimit = "Please enter valid details."
    static let EmptyCategory = "Please select category."
    
    
}
struct AppFonts {
    static func KhmerBold(size: CGFloat) -> UIFont{
        if let font = UIFont(name: "KhmerUI-Bold", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func KhmerRegular(size: CGFloat) -> UIFont{
        if let font = UIFont(name: "KhmerUI", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func RobotoBoldFontWithSize(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Roboto-Bold", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func RobotoRegularFontWithSize(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Roboto-Regular", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func RobotoLightFontWithSize(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Roboto-Light", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func RobotoMediumFontWithSize(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Roboto-Medium", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
struct CountryCodes {
    static let countryDictionary  = ["AF":"+93","AL":"+355","DZ":"+213","AS":"+1","AD":"+376","AO":"+244","AI":"+1","AG":"+1","AR":"+54","AM":"+374","AW":"+297","AU":"+61","AT":"+43","AZ":"+994","BS":"+1","BH":"+973","BD":"+880","BB":"+1","BY":"+375","BE":"+32","BZ":"+501","BJ":"+229","BM":"+1","BT":"+975","BA":"+387","BW":"+267","BR":"+55","IO":"+246","BG":"+359","BF":"+226","BI":"+257","KH":"+855","CM":"+237","CA":"+1","CV":"+238","KY":"+345","CF":"+236","TD":"+235","CL":"+56","CN":"+86","CX":"+61","CO":"+57","KM":"+269","CG":"+242","CK":"+682","CR":"+506","HR":"+385","CU":"+53","CY":"+537","CZ":"+420","DK":"+45","DJ":"+253","DM":"+1","DO":"+1","EC":"+593","EG":"+20","SV":"+503","GQ":"+240","ER":"+291","EE":"+372","ET":"+251","FO":"+298","FJ":"+679","FI":"+358","FR":"+33","GF":"+594","PF":"+689","GA":"+241","GM":"+220","GE":"+995","DE":"+49","GH":"+233","GI":"+350","GR":"+30","GL":"+299","GD":"+1","GP":"+590","GU":"+1","GT":"+502","GW":"+245","GY":"+595","HT":"+509","HN":"+504","HU":"+36","IS":"+354","IN":"+91","ID":"+62","IQ":"+964","IE":"+353","IL":"+972","IT":"+39","JM":"+1","JP":"+81","JO":"+962","KZ":"+77","KE":"+254","KI":"+686","KW":"+965","KG":"+996","LV":"+371","LB":"+961","LS":"+266","LR":"+231","LI":"+423","LT":"+370","LU":"+352","MG":"+261","MW":"+265","MY":"+60","MV":"+960","ML":"+223","MT":"+356","MH":"+692","MQ":"+596","MR":"+222","MU":"+230","YT":"+262","MX":"+52","MC":"+377","MN":"+976","ME":"+382","MS":"+1","MA":"+212","MM":"+95","NA":"+264","NR":"+674","NP":"+977","NL":"+31","AN":"+599","NC":"+687","NZ":"+64","NI":"+505","NE":"+227","NG":"+234","NU":"+683","NF":"+672","MP":"+1","NO":"+47","OM":"+968","PK":"+92","PW":"+680","PA":"+507","PG":"+675","PY":"+595","PE":"+51","PH":"+63","PL":"+48","PT":"+351","PR":"+1","QA":"+974","RO":"+40","RW":"+250","WS":"+685","SM":"+378","SA":"+966","SN":"+221","RS":"+381","SC":"+248","SL":"+232","SG":"+65","SK":"+421","SI":"+386","SB":"+677","ZA":"+27","GS":"+500","ES":"+34","LK":"+94","SD":"+249","SR":"+597","SZ":"+268","SE":"+46","CH":"+41","TJ":"+992","TH":"+66","TG":"+228","TK":"+690","TO":"+676","TT":"+1","TN":"+216","TR":"+90","TM":"+993","TC":"+1","TV":"+688","UG":"+256","UA":"+380","AE":"+971","GB":"+44","US":"+1","UY":"+598","UZ":"+998","VU":"+678","WF":"+681","YE":"+967","ZM":"+260","ZW":"+263","BO":"+591","BN":"+673","CC":"+61","CD":"+243","CI":"+225","FK":"+500","GG":"+44","VA":"+379","HK":"+852","IR":"+98","IM":"+44","JE":"+44","KP":"+850","KR":"+82","LA":"+856","LY":"+218","MO":"+853","MK":"+389","FM":"+691","MD":"+373","MZ":"+258","PS":"+970","PN":"+872","RE":"+262","RU":"+7","BL":"+590","SH":"+290","KN":"+1","LC":"+1","MF":"+590","PM":"+508","VC":"+1","ST":"+239","SO":"+252","SJ":"+47","SY":"+963","TW":"+886","TZ":"+255","TL":"+670","VE":"+58","VN":"+84","VG":"+284","VI":"+340"]
}


