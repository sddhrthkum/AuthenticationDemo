//
//  OTPView.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 09/03/22.
//

import Foundation
import UIKit

protocol OTPAuthenticationViewDelegagte: AnyObject {
   func didEnterValidOTP()
}

final class OTPTextField: UITextField {
    var previousTextField: UITextField?
    var nextTextFiled: UITextField?
    
    override func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}

final class OTPView: UIStackView {
    private var textFieldArray = [OTPTextField]()
    private let numberOfOTPdigit = 4
    private let validOTP = "1234"
    private var tagMap = [Int: String]()
    weak var delegate: OTPAuthenticationViewDelegagte?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setTextFields()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        setTextFields()
    }
    
    //To setup stackview
    private func setupStackView() {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 5
    }
    
    //To setup text fields
    private func setTextFields() {
        for i in 0..<numberOfOTPdigit {
            let field = OTPTextField()
            textFieldArray.append(field)
            addArrangedSubview(field)
            field.delegate = self
            field.backgroundColor = .white
            field.layer.opacity = 0.5
            field.textAlignment = .center
            field.layer.shadowColor = UIColor.black.cgColor
            field.layer.shadowOpacity = 0.1
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.lightGray.cgColor
            field.tag = i
            i != 0 ? (field.previousTextField = textFieldArray[i-1]) : ()
            i != 0 ? (textFieldArray[i-1].nextTextFiled = textFieldArray[i]) : ()
        }
    }
    
    var isValidOTP: Bool {
        var otp = ""
        for i in 0..<numberOfOTPdigit {
            guard let value = tagMap[i] else {return false }
            otp += value
        }
        if otp == validOTP { return true }
        return false
    }
}

extension OTPView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let field = textField as? OTPTextField else {
            return true
        }
        if !string.isEmpty {
            field.text = string
            tagMap[field.tag] = string
            field.resignFirstResponder()
            field.nextTextFiled?.becomeFirstResponder()
            if isValidOTP {
                delegate?.didEnterValidOTP()
                return false
            }
            return true
        }
        return true
    }
}
