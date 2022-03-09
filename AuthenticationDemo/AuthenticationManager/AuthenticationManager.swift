//
//  AuthenticationManager.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 09/03/22.
//

import Foundation
import LocalAuthentication

final class AuthenticationManager {
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    private var context = LAContext()
    static let shared = AuthenticationManager()
    private (set) var state = AuthenticationState.loggedout
    
    private init() {}
    
    private var biometryType: LABiometryType {
        return context.biometryType 
    }
    
    var isFaceID: Bool {
        biometryType == .faceID
    }
    
    func authenticateUser(completion: @escaping (_: Bool, _ : Error?) -> Void) {
        if state == .loggedin { state = .loggedout }
        context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                if success { self.state = .loggedin }
                completion(success, error)
            }
        } else {
            completion(false, NSError(domain: "Error", code: 0, userInfo: nil))
        }
    }
    
    func contextEvaluationPolicy() {
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
}
