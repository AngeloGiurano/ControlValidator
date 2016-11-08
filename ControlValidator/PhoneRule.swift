//
//  PhoneRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation

class PhoneRule: ValidationRule {
    
    func validate(_ string: String?) -> Bool {
        
        if let text = string{
            let PHONE_REGEX = "^\\d{1,20}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result =  phoneTest.evaluate(with: text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            return result
        }else{
            return false
        }
    }
 

}
