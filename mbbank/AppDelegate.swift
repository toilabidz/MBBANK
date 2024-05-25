import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Yêu cầu quyền hiển thị thông báo
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Quyền hiển thị thông báo đã được cấp.")
            } else {
                print("Không thể yêu cầu quyền hiển thị thông báo: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        return true
    }

    // Các phương thức khác của AppDelegate...
}