//
//  PlacesViewController.swift
//  FourSquareClone
//
//  Created by AHMET HAKAN YILDIRIM on 31.10.2022.
//

import UIKit
import Parse

class PlacesViewController: UIViewController {

    // MARK: - UI ELEMENTS
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTİES
    
    // MARK: - LİFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonClicked))
    }
    
    // MARK: - FUNCTİONS
    
    @objc func addButtonClicked() {
        // Segue 
    }
    
    @objc func logoutButtonClicked() {
        PFUser.logOutInBackground { error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else {
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
    }
    
    // MARK: - ACTİONS
    
    

}
