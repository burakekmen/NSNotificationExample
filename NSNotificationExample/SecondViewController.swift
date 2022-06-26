//
//  SecondViewController.swift
//  NSNotificationExample
//
//  Created by Burak Ekmen on 26.06.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(
            // MARK: Bu key ile Notification dinleyen yerlere Notification iletiyoruz
            name: NSNotification.Name.init(rawValue: "SecondScreenDataObserver"),
            object: self,
            
            /* MARK: userInfo -> [AnyHashable : Any] dictionary tipindedir
                
             * secondScreenPassData -> Bu bizim iletecegimiz verimizin key bilgisidir. FirstViewController icerisinde bu key ile verimizi bulacagız
             * Yollamak istediginiz verileri "key", value seklinde userInfo array icerisine ekleyebilirsiniz
             
            */
            userInfo: ["secondScreenPassData": SecondPassDataModel(content: " This is Second Screen Data :) ")]
        )
    }
    
}



class SecondPassDataModel {
    let content : String?
    
    init(content : String?){
        self.content = content
    }
}
