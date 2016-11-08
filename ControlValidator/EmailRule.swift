//
//  EmailRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation

class EmailRule: ValidationRule, ValidationRuleProtocol {
    
    func validate(_ string: String?) -> Bool {
        if let text = string{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: text)
            return result
        }else{
            return false
        }
    }
    
    

}
