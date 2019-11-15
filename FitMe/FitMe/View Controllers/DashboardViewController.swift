//
//  DashboardViewController.swift
//  FitMe
//
//  Created by JJ on 2019-11-08.
//  Copyright © 2019 JJ. All rights reserved.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        authenticateUserAndConfigureView()
        // Do any additional setup after loading the view.
    }
    
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: LoginViewController())
                self.present(navController, animated: true, completion: nil)
                
                
            }
        }
    }

}
