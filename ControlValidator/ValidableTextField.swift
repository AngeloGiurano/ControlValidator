//
//  ControlTextField.swift
//  ControlValidator
//
//  Created by Angelo Giurano on 11/7/16.
//
//

import Foundation
import UIKit


public class ValidableTextField: UITextField, ValidationProtocol {
    
    public var validationRules: [ValidationRule]?
    @IBOutlet public weak var validationDelegate : ValidationDelegate?
    private var  valid : Bool?
    public var isValid : Bool{
        
        get{
            
            guard let _ = valid  else {
                
               valid = validate()
               
                return valid!
                
            }
            
            return valid!
            
        }
    }
    
    
    var errorplaceHolder: UILabel?
    var labelerror: UILabel?
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let border = CALayer()
        let width = CGFloat(0.55)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: rect.size.height - width, width:  rect.size.width, height: rect.size.height)
        
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingDidEnd)
        self.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    func textFieldDidChange() {
        
        if validate(){
            self.backgroundColor = UIColor.clear
        }else{
            self.backgroundColor = UIColor.red
        }
        
    }
    
//    func validate() -> (ValidationRuleProtocol?) {
//        let validationResults = validationRules?.filter({
//            
//            return !$0.validate(self.text)
//          // return (ValidationRuleProtocol)!$0.validate(self.text!)
//            // return !$0.validationRegEx(self.text!)
//        }).first
//        
//        return validationResults

//        return true
    
//        if validationResults == nil {
//            return (true, nil)
//        } else {
//            return (false, validationResults?.errorMessage)
//        }
//    }

    
    public func validate(byRule rule: ValidationRule) -> Bool {
        
        return rule.validationRule.validate(text)

    }

    
    
}
