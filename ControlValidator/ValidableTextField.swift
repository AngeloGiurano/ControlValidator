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
    
    public var validationRules: [ValidationRuleType]?
    @IBOutlet public weak var validationDelegate : ValidationDelegat?
    
    var errorplaceHolder: UILabel?
    var labelerror: UILabel?
    var isValid: Bool = false
    
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
        let validationResult = validate()
        
        
        
//        ///will change information schemes - like somting bacground color, bordering text etc.
//        if let error = validationResult.error, !validationResult.success {
//            self.isValid = false
//            
//            if labelerror == nil {
//                labelerror = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: errorplaceHolder!.frame.height))
//            }
//            
//            labelerror?.text = error
//            labelerror?.numberOfLines = 0
//            labelerror?.font = errorplaceHolder?.font
//            labelerror?.textColor = UIColor.red
//            labelerror?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//            labelerror?.sizeToFit()
//            labelerror?.backgroundColor = UIColor.white
//            
//            errorplaceHolder?.textColor = UIColor.clear
//            errorplaceHolder?.addSubview(labelerror!)
//            errorplaceHolder?.bringSubview(toFront: labelerror!)
//            
//            
//            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [], animations: {
//                self.labelerror!.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//            }, completion: {
//                _ in
//                self.labelerror!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            })
//            
//            return
//        } else {
//            isValid = true
//            if let labelerror = labelerror {
//                errorplaceHolder?.textColor = UIColor.red
//                labelerror.removeFromSuperview()
//            }
//        }
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


    public func validate() -> Bool {

        
        if let rules = validationRules {
            
            return validate(byRules: rules)
            
        }else{
            
            return false
            
        }
        
    }
    
    public func validate(byRule: ValidationRuleType)->Bool{
        
        //testing endpoint by one rule
        
        return true
    }
    
    
    public func validate(byRules: [ValidationRuleType])->Bool{
        
        if let rules = validationRules {
            
            for rule in rules{
                
                if !validate(byRule: rule){
                    return false
                }
                
            }
     
            return true
            
        }else{
        
            return true
        
        }
    
    }
    
}

