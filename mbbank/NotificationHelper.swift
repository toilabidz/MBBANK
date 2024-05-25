import UIKit
import UserNotifications

class NotificationHelper {
    static func showNotification(appName: String, message: String) {
        let content = UNMutableNotificationContent()
        content.title = appName
        content.body = message
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error showing notification: \(error.localizedDescription)")
            } else {
                print("Notification displayed successfully!")
            }
        }
    }
}