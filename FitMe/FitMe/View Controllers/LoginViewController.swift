//
//  ViewController.swift
//  FitMe
//
//  Created by JJ on 2019-11-08.
//  Copyright © 2019 JJ. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPass: UITextField!
    
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func handleLogin(_ sender: UIButton) {
        guard let email = tfEmail.text else { return }
        guard let password = tfPass.text else { return }
        
        logUserIn(withEmail: email, password: password)
        
    }
    
    
    // MARK: - API
    
    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                
                let alert = UIAlertController(title: "Invalid", message: "Are you sure you have the right email/password?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
                print("Failed to sign user in with error: ", error.localizedDescription)
                return
            }else{
                print("logined!")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "dashboardsb") as! DashboardViewController
                self.present(newViewController, animated: true, completion: nil)
            }
            
        }
        
    }


}

