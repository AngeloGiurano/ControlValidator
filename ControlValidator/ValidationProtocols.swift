//
//  ValidationProtocols.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 08.11.2016.
//
//

import Foundation

public protocol ValidationProtocol{
    
    var validationRules: [ValidationRule]? {get set}
    weak var validationDelegate : ValidationDelegate? {get set}
    var isValid : Bool {get}
    
    
    func validate()->Bool
    func validate(byRule rule: ValidationRule)->Bool
    func validate(byRules rules: [ValidationRule])->Bool
    
}

extension ValidationProtocol{
    
    public func validate() -> Bool {
        
        if let rules = validationRules{
            
            return validate(byRules: rules)

        }
        
        return true
        
    }
    
    public func validate(byRules rules: [ValidationRule]) -> Bool {
        
        for rule in rules {
            
            if !validate(byRule: rule) {
                
                if  let delegate = validationDelegate {
                    
                    delegate.validationFailed()
                    
                }
                
                return false
                
            }
            
        }
        
        return true
        
    }
    
}

@objc public protocol ValidationDelegate: class{
    
    func validationSuccess()
    func validationFailed()
    
}


public extension ValidationDelegate{
    
    func validationSuccess(){}
    
    func validationFailed(){}
    
}
