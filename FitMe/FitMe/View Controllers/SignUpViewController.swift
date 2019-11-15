//
//  SignUpViewController.swift
//  FitMe
//
//  Created by JJ on 2019-11-08.
//  Copyright © 2019 JJ. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSignUp(_ sender: UIButton) {
        
        if(tfEmail.text == "" || tfPass.text == "" || tfUsername.text == ""){
            
            let alert = UIAlertController(title: "Invalid", message: "All fields must be filled!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        if(tfPass.text?.count ?? 0 < 7){
            
            let alert = UIAlertController(title: "Invalid", message: "Password must be longer than 6 characters", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        guard let email = tfEmail.text else { return }
        guard let password = tfPass.text else { return }
        guard let username = tfUsername.text else { return }
        
        createUser(withEmail: email, password: password, username: username)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "userprofilesb") as! UserProfileViewController
        self.present(newViewController, animated: true, completion: nil)
    
    }
    

    func createUser(withEmail email: String, password: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign user up with error: ", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
                }
                print("successfully signed up!!")
            })
            
        }
        
    }
    

}
