//
//  CustomRegexRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 09.11.2016.
//
//

import Foundation

class RegexRule: Rule, RuleProtocol {
    
    let regexRule : String
    
    init(regexRule: String) {
        self.regexRule = regexRule
    }
    
    func validate(_ string: String?) -> Bool {
        
        
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", regexRule)
        
        if let text = string{
         
            let result =  phoneTest.evaluate(with: text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            return result
            
        }
    
        return false
    }
    
    
}
