//
//  ViewController.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 23/01/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInTest(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            let user = signInResult.user
            let authModel = AuthModel(fullName: user.profile?.name,
                                      emailAddress: user.profile?.email,
                                      imageUrl: user.profile?.imageURL(withDimension: 320),
                                      seniorityLevel: "Ssr")
//            authModel.fullName = user.profile?.name
//            authModel.emailAddress = user.profile?.email
//            authModel.imageUrl = user.profile?.imageURL(withDimension: 320)
            
            print(authModel)
        }
    }

}

