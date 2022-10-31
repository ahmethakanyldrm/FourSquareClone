//
//  SignUpViewController.swift
//  FourSquareClone
//
//  Created by AHMET HAKAN YILDIRIM on 31.10.2022.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    // MARK: - UI ELEMENTS
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    // MARK: - PROPERTİES
    
    // MARK: - LİFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - FUNCTİONS
    
    func parseGetData() {
        
        let query = PFQuery(className: "Fruits")
       // query.whereKey("name", equalTo: "Apple")
        query.whereKey("calories", greaterThan: 100)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                print(objects)
            }
        }
    }
    
    func parseDataSave() {
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 250
        parseObject.saveInBackground{(success, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }else {
                print("uploaded")
            }
        }
    }
    
    func makeAlert(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    // MARK: - ACTİONS
    
    
    @IBAction func signInButtonClicked(_ sender: UIButton) {
        
        if userNameTextField.text != "" && passwordTextField.text != "" {
            
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { (user,error) in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else {
                    // Segue
//                    print("Welcome")
//                    print(user?.username)
                    
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                
            }
            
        }else {
            makeAlert(title: "Error", message: "Username / Password ??")
        }
        
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        
        if userNameTextField.text != "" && passwordTextField.text != "" {
            
            let user = PFUser()
            user.username = userNameTextField.text
            user.password = passwordTextField.text
            user.signUpInBackground { (success,error) in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else {
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(title: "Error", message: "Username / Password ??")
        }
        
    }
    
}

