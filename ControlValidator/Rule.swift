//
//  ValidationRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation

protocol RuleProtocol {
    
    func validate(_ string: String?) -> Bool
    

}

class Rule {
    
    //propozytion to agregate smal rules like min one UpeerCase letter, min letters etc. to generate more complex test
//    var subRules : [RuleProtocol]?
    
}
