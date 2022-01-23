//
//  RegisterViewController.swift
//  FinalProject_Friends_iOS
//
//  Created by Shivam on 16/01/2022.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
   // MARK: UIButton
    @IBAction func register(_ sender: UIButton) {
        
        if !fullName.text!.isEmpty && !email.text!.isEmpty && !phone.text!.isEmpty && !password.text!.isEmpty && !confirmPassword.text!.isEmpty && !username.text!.isEmpty {
            
            // check is password and confirm password is same
            if password.text == confirmPassword.text {
                // add function to store user data in database
                let newUser = User(context: context)
                newUser.fullName = fullName.text
                newUser.email = email.text
                newUser.phone = phone.text
                newUser.password = password.text
                newUser.username = username.text
                appDelegate.saveContext()
                
                // store username and password to check if user has logged in later
                let defaults = UserDefaults.standard
                defaults.set(username.text, forKey: "username")
                defaults.set(password.text, forKey: "password")
                
                appDelegate.goToTaskListPage()
            } else {
                let alertController = UIAlertController(title: "Invalid", message: "Password and Confirm Password must be same.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
            
        } else {
            let alertController = UIAlertController(title: "Invalid", message: "Please fill all of the fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
