//
//  testing.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation


func testing(test: String) -> String? {
    
    let validableText = ValidableTextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 40.00))
    
    validableText.text = "Test text"

    validableText.validationRules = [ValidationRule.email, ValidationRule.nonEmpty, ValidationRule.regexValidation("sfasdF")]

    
    return validableText.text
    
}
