//
//  NotEmptyRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 09.11.2016.
//
//

import Foundation


class NotEmptyRule: Rule, RuleProtocol {
    
    func validate(_ string: String?) -> Bool {
        
        if let text = string {
            
            return text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != ""
//            return !text.isEmpty
            
        }else{
            
            return false
            
        }
        
    }
    
}
