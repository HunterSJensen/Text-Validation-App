//
//  ViewController.swift
//  Text Validation App
//
//  Created by Hunter Jensen on 9/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var image: UIImageView!
    var whatError: String = ""
//    let password = "Password!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = image.frame.height / 2
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        if validatePassword(pass: passwordText.text!) {
            let alert = UIAlertController(title: "Alert", message: "Logging in...", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        } else {
            let alert2 = UIAlertController(title: "Alert", message: whatError, preferredStyle: .actionSheet)
            alert2.addAction(UIAlertAction(title: "Back", style: .destructive))
            self.present(alert2, animated: true)
        }
    }
    
    func validatePassword(pass: String) -> Bool {
        // don't say passwordText.text
        let charSet = CharacterSet(charactersIn: "!%@#$&")
        var isItTrue: Bool = true
        if pass.rangeOfCharacter(from: charSet) != nil {
            // it has it
            if pass.count >= 8 {
                isItTrue = true
                return isItTrue
            } else {
                whatError = "Your password is not 8 characters long"
                return false
            }
        } else {
            whatError = "Your Password is missing a Sp. character"
            isItTrue = false
        }
        return isItTrue
    }
}

 
 
