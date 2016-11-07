//
//  ControlTextField.swift
//  ControlValidator
//
//  Created by Angelo Giurano on 11/7/16.
//
//

import Foundation
import UIKit

class ControlTextField: UITextField {
    
    //    typealias ValidationRule = () -> Bool
    var errorplaceHolder: UILabel?
    var validationRules: [ValidationRuleType]?
    var labelerror: UILabel?
    var isValid: Bool = false
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let border = CALayer()
        let width = CGFloat(0.55)
        border.borderColor = UIColor.gray
        border.frame = CGRect(x: 0, y: rect.size.height - width, width:  rect.size.width, height: rect.size.height)
        
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingDidEnd)
        self.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    func textFieldDidChange() {
        let validationResult = validate()
        
        if let error = validationResult.error, !validationResult.success {
            self.isValid = false
            
            if labelerror == nil {
                labelerror = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: errorplaceHolder!.frame.height))
            }
            
            labelerror?.text = error
            labelerror?.numberOfLines = 0
            labelerror?.font = errorplaceHolder?.font
            labelerror?.textColor = UIColor.red
            labelerror?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            labelerror?.sizeToFit()
            labelerror?.backgroundColor = UIColor.white
            
            errorplaceHolder?.textColor = UIColor.clear
            errorplaceHolder?.addSubview(labelerror!)
            errorplaceHolder?.bringSubview(toFront: labelerror!)
            
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [], animations: {
                self.labelerror!.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }, completion: {
                _ in
                self.labelerror!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
            
            return
        } else {
            isValid = true
            if let labelerror = labelerror {
                errorplaceHolder?.textColor = UIColor.red
                labelerror.removeFromSuperview()
            }
        }
    }
    
    func validate() -> (success: Bool, error: String?) {
        let validationResults = validationRules?.filter({
            return !$0.validationRegEx(self.text!)
        }).first
        
        if validationResults == nil {
            return (true, nil)
        } else {
            return (false, validationResults?.errorMessage)
        }
    }
}


protocol ValidationType {
    var type: ValidationRuleType { get set }
    func validate(string: String) -> Bool
}

extension ValidationType {
    func validate(string: String) -> Bool {
        return self.type.validationRegEx(string)
    }
}

protocol ValidationRuleType {
    var validationRegEx: ValidationRegex { get }
    var errorMessage: String { get }
}

extension ValidationRuleType {
    typealias ValidationRegex = (String) -> Bool
}

enum BasicValidationRules: ValidationRuleType {
    case email
    case password
    case nonEmpty
    case minLength
    
    var validationRegEx: BasicValidationRules.ValidationRegex  {
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
            }
        }
    }
    
    var errorMessage: String {
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
            }
        }
    }
}

func isValidEmail(string: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluateWithObject(string)
    return result
}

func isValidPhoneNumber(string: String) -> Bool {
    let PHONE_REGEX = "^\\d{1,20}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluateWithObject(string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
    return result
}

func isValidPassword(string: String) -> Bool {
    let length = 8
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
    let capitalresult = texttest.evaluateWithObject(string)
    
    return capitalresult && string.characters.count > length
}


func isNonEmpty(string: String) -> Bool {
    return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) != ""
}

func isMinLength(string: String) -> Bool {
    let length = 8
    return string.characters.count >= length
}
