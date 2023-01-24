//
//  ViewController.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 23/01/23.
//

import UIKit
import GoogleSignIn

class AuthViewController: UIViewController {
    
    var authModel = AuthModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            let user = signInResult.user
            self.authModel = AuthModel(fullName: user.profile?.name,
                                      emailAddress: user.profile?.email,
                                      imageUrl: user.profile?.imageURL(withDimension: 320),
                                      seniorityLevel: "Ssr")
            
            self.performSegue(withIdentifier: "goHome", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goHome" {
            let homeViewController = segue.destination as! HomeViewController
            homeViewController.authModel = authModel
        }
    }

}

