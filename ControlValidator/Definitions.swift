//
//  ControlValidatorTypes.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation


protocol ValidationRuleType {
    
    var validationRule: RuleProtocol{get}
    
    //    var validationRegEx: ValidationRegex { get }
    //    var errorMessage: String { get }
}



public enum ValidationRule: ValidationRuleType{
    case email
    case password
    case nonEmpty
    case minLength(Int)
    case phone
    case regexValidation(String)
    
    var validationRule: RuleProtocol  {
        get {
            switch self {
            case .email:
                return EmailRule()
            case .password:
                return PhoneRule()
            case .nonEmpty:
                return NotEmptyRule()
            case .minLength(let min):
                return MinSignRule(minLenght: min)
            case .phone:
                return PhoneRule()
            case .regexValidation(let regexString):
                return RegexRule(regexRule: regexString)
            }
        }
    }
    
//    public var errorMessage: String {
//        get {
//            switch self {
//            case .email:
//                return "NOT_VALID_EMAIL".localized
//            case .password:
//                return "NOT_VALID_PASSWORD".localized
//            case .nonEmpty:
//                return "NOT_EMPTY".localized
//            case .minLength:
//                return "MIN_LENGTH".localized
//            case .customRegexValidation( _):
//                return "regex".localized
//            }
//        }
//    }
}



