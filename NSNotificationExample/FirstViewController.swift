//
//  ViewController.swift
//  NSNotificationExample
//
//  Created by Burak Ekmen on 26.06.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var btnOpenSecondPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // MARK: Ekran acılısında notification dinlemek icin tanımlıyoruz
        observeNotification()
    }
    
}



internal extension FirstViewController {
    private func observeNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleNotificationData(_:)), // MARK: Notification geldiginde tetiklenecek fonksiyonumuz
                                               name: NSNotification.Name.init(rawValue: "SecondScreenDataObserver"), // MARK: Bu key ile Notification dinliyoruz.
                                               object: nil)
    }
    
    // MARK: Notification geldiginde icerisinden verileri alacagımız foknsiyonumuz
    @objc private func handleNotificationData(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let data = userInfo["secondScreenPassData"] as? SecondPassDataModel {
                showAlert(message: data.content)
             }
         }
    }
    
    // MARK: Ekranda verimizi gosteriyoruz :)
    private func showAlert(message: String?) {
        let alert = UIAlertController(title: "Pass Data", message: message, preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "Okey",
                                      style: .default,
                                      handler: { _ in })
        alert.addAction(positiveAction)
        
        self.present(alert, animated: true)
    }
    
}
