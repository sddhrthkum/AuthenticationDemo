//
//  ViewController.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 09/03/22.
//

import UIKit

final class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthenticationManager.shared.contextEvaluationPolicy()
        iconImageView.image = AuthenticationManager.shared.isFaceID ?
        UIImage(named: "profileImageIcon") :
        UIImage(named: "fingerprint")
    }

    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        AuthenticationManager.shared.authenticateUser { success, error in
            if success {
                DispatchQueue.main.async {
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPAuthenticationVC")
                    viewController.modalPresentationStyle = .fullScreen
                    self.navigationController?.setViewControllers([viewController], animated: true)
                }
            }
        }
    }
}

