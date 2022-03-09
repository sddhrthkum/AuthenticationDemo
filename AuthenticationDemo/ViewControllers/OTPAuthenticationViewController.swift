//
//  OTPAuthenticationViewController.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 10/03/22.
//

import Foundation
import UIKit

final class OTPAuthenticationViewController: UIViewController {
    
    @IBOutlet weak var otpView: OTPView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpView.delegate = self
    }
}

extension OTPAuthenticationViewController: OTPAuthenticationViewDelegagte {
    func didEnterValidOTP() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.setViewControllers([viewController], animated: false)
    }
}
