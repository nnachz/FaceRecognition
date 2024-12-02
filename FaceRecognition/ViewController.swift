//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Kerem Türközü on 9.09.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        
        let authContext = LAContext() // doğrulama işlemleri için kullanılır
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                if success == true {
                    //successful auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)

                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
        }
    }
    
}

