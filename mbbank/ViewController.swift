import UIKit

class ViewController: UIViewController {
    
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gọi hàm để hiển thị thông báo
        let (appName, message) = getUserInput()
        NotificationHelper.showNotification(appName: appName, message: message)
        
        // Thêm button để đổi ảnh avatar
        let avatarButton = UIButton(type: .system)
        avatarButton.setTitle("Đổi ảnh avatar", for: .normal)
        avatarButton.addTarget(self, action: #selector(changeAvatar), for: .touchUpInside)
        view.addSubview(avatarButton)
        avatarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            avatarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func changeAvatar() {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    func getUserInput() -> (appName: String, message: String) {
        print("Nhập tên ứng dụng:")
        let appName = "MB Bank"
        
        print("Nhập nội dung thông báo:")
        let message = readLine() ?? "This is a notification message."
        
        return (appName, message)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            // Lưu ảnh avatar mới
            UserDefaults.standard.set(image.pngData(), forKey: "avatar")
        }
        dismiss(animated: true, completion: nil)
    }
}

// Thông tin tác giả
extension ViewController {
    private var authorInfo: String {
        return "Nguyễn Đức Phú (tilly289)"
    }
}