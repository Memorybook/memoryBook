//
//  signIn.swift
//  MillerCodyAssignment4
//
//  Created by Cody Miller on 10/23/15.
//  Copyright © 2015 Cody Miller. All rights reserved.
//
import Parse

class SignIn {
    
    // declare variables as optional Strings, optional means String may return nil.
    // optionals need unwrapped by adding a ! to the end.
    var userName: String?
    var password: String?
    
    // initialize each variable for use below. This is done by initializing this SignUp model in a given view controller and passing in the required variables.
    init(user: String, pass: String) {
        self.userName = user
        self.password = pass
    }
    // this will call each function below checking for errors during sign up and return true if all of our error checks return true or throws a specific error based on the specific function.
    func signInUser() throws {
        
        // when using throws above you will write guard the function name then else with an error that is thrown if your function returns false. Each error below is called from our Enums model.
        guard hasEmptyFields() else {
            throw Error.emptyField
        }
        
        guard checkUserCredentials() else {
            throw Error.incorrectSignIn
        }
        
    }
    // Check to make sure none of the text fields on our sign up view are empty
    func hasEmptyFields() -> Bool {
        if !userName!.isEmpty && !password!.isEmpty {
            return true
        }
        return false
    }
    // use logInWithUsername method to log in
    func checkUserCredentials() -> Bool {
        
        do{
            try PFUser.logInWithUsername(userName!, password: password!)
               
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
                
            }
        // if log in is successful currentUser will be set and not nil
        if (PFUser.currentUser() != nil) {
            return true
        }
        return false
    }
    
    
}