//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        // 이 optional binding은 그냥 푸는 것도 중요하지만 '비어있을 때' 실행 안 하기 위해서도 필요함
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              // guard let strongSelf = self else { return } <- outdated
                guard let self = self else {return}
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    // if there's no error
                    // 자동으로 로그인 상태가 되는가봐..
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
       
    }
    
}
