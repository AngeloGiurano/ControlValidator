//
//  ValidationProtocols.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 08.11.2016.
//
//

import Foundation

public protocol ValidationProtocol {
    
    var validationRules: [ValidationRuleType]? {get set}
    weak var validationDelegate : ValidationDelegat? {get set}
    
    func validate()->Bool
    func validate(byRule: ValidationRuleType)->Bool
    func validate(byRules: [ValidationRuleType])->Bool
    
}

@objc public protocol ValidationDelegat: class{
    
    func validationSuccess()
    func validationFailed()
    
}
