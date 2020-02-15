import Foundation


enum Gender:String{
    case MALE = "Male"
    case FEMALE = "Female"
}

enum PrefferedLanguage: String{
    case English = "English"
    case Arabic = "Arabic"
    
}
enum ColorType: String {
    case blue = "BB0F20"
    case textColor = "555555"
}
enum Tabs: String{
    case Notification = "Notifications"
    case NewsFeeds = "News Feeds"
    case Browser = "Browser"
    case CheckVote = "Check Vote"
    
    
}
enum NotificationType:String {
    case Message = "message"
    case Notification = "notification"
    case Tinder = "tinder"
    case Event = "event"
    case Discount = "discount"
    case Profile = "profile"
    case Popup = "popup"
    case Default = "default"
}

enum ComplaintStatus: String{
    case Pending = "submitted by user"
    case Received = "received"
    case Reviewed = "reviewed"
    case Rejected  = "rejected"
    
    case Accepted = "accepted"
    case TicketIssued = "ticket issued"
    case TicketPaid = "ticket paid"
    case Reward  = "reward"
    case Rewarded  = "commission rewarded"
    
    
    
    
   
}
