//
//  ProfileVC.swift
//  chatroom
//
//  Created by Nikita Koniukh on 23/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setuView()
    }
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setuView(){
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.backgroundColor = UserDataService.instance.returnUIClor(components: UserDataService.instance.avatarColor)
        
        let closeTapped = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        bgView.addGestureRecognizer(closeTapped)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
