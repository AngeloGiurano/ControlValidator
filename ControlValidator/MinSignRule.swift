//
//  MinSignRule.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 09.11.2016.
//
//

import Foundation

class MinSignRule: Rule, RuleProtocol {
    
    let minLenght : Int
    
    init(minLenght:Int){
        self.minLenght = minLenght
    }
    
    
    func validate(_ string: String?) -> Bool {
        
        guard let _ = string else {
            return false
        }
        
        return string!.characters.count >= minLenght
        
    }
    
}
