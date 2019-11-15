//
//  UserProfileViewController.swift
//  FitMe
//
//  Created by JJ on 2019-11-08.
//  Copyright © 2019 JJ. All rights reserved.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnSignOut: UIButton!
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GetUserData()
        
    }
    
    func GetUserData(){
        let userID = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.lblEmail.text = value?["email"] as? String ?? ""
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func handleSignOut(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginsb") as! LoginViewController
            self.present(newViewController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error..", error)
        }
    }
}
