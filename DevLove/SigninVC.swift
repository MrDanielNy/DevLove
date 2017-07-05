//
//  SigninVC.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//
/* Handle the signin from either FB, Twitter or Firebase. Press register to open a new View a handle registration.
 
 */



import UIKit
import Firebase

class SigninVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func createUserWithFB() {
        //Callback funktion to create FB user
        
        
        
    }

    @IBAction func registerUserTapped(_ sender: Any) {
        //Check if fields are filled in, and create or show viewController for registration
        
        if emailField.text != nil || emailField.text != "" && passwordField.text != nil || passwordField.text != "" {
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
            })
            performSegue(withIdentifier: "goToNewsFeed", sender: nil)
        }
        
    }
    
    @IBAction func signinUserTapped(_ sender: Any) {
        if emailField.text != nil || emailField.text != "" && passwordField.text != nil || passwordField.text != "" {
            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if error != nil {
                    print("signinUserTapped: Error \(String(describing: error))")
                }
            })
            performSegue(withIdentifier: "goToNewsFeed", sender: nil)
        }
    }
    
    

}

