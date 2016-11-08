//
//  ControlValidatorTypes.swift
//  ControlValidator
//
//  Created by Piotr Witczak on 07.11.2016.
//
//

import Foundation


protocol ValidationType {
    var type: ValidationRuleType { get set }
    func validate(string: String) -> Bool
}

extension ValidationType {
    func validate(string: String) -> Bool {
        return self.type.validationRegEx(string)
    }
}

public protocol ValidationRuleType {
    var validationRegEx: ValidationRegex { get }
    var errorMessage: String { get }
}

public extension ValidationRuleType {
    public typealias ValidationRegex = (String) -> Bool
}

public enum BasicValidationRules: ValidationRuleType {
    case email
    case password
    case nonEmpty
    case minLength
    case customRegexValidation(String)
    
    public var validationRegEx: BasicValidationRules.ValidationRegex  {
        get {
            switch self {
            case .email:
                return isValidEmail
            case .password:
                return isValidPassword
            case .nonEmpty:
                return isNonEmpty
            case .minLength:
                return isMinLength
            case .customRegexValidation( _):
                return isNonEmpty
            }
        }
    }
    
    public var errorMessage: String {
        get {
            switch self {
            case .email:
                return "NOT_VALID_EMAIL".localized
            case .password:
                return "NOT_VALID_PASSWORD".localized
            case .nonEmpty:
                return "NOT_EMPTY".localized
            case .minLength:
                return "MIN_LENGTH".localized
            case .customRegexValidation( _):
                return "regex".localized
            }
        }
    }
}


//TODO remove at the end
func isValidEmail(string: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: string)
    return result
}

func isValidPhoneNumber(string: String) -> Bool {
    let PHONE_REGEX = "^\\d{1,20}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    return result
}

func isValidPassword(string: String) -> Bool {
    let length = 8
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
    let capitalresult = texttest.evaluate(with: string)
    
    return capitalresult && string.characters.count > length
}


func isNonEmpty(string: String) -> Bool {
    return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != ""
}

func isMinLength(string: String) -> Bool {
    let length = 8
    return string.characters.count >= length
}
