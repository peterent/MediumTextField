//
//  FormFieldTextModel.swift
//  MediumTextField
//
//  Created by Peter Ent on 12/31/19.
//  Copyright © 2019 Peter Ent. All rights reserved.
//

import SwiftUI

class FormFieldTextOptions: NSObject {
    
    var placeholder: String = ""
    var returnKeyType: UIReturnKeyType = .next
    var autoCorrectionType: UITextAutocorrectionType = .default
    var autoCapitalizationType: UITextAutocapitalizationType = .sentences
    var keyboardType: UIKeyboardType = .default
    var borderStyle: UITextField.BorderStyle = .roundedRect
    var isSecure = false
    
    var textColor: UIColor?
    var placeholderColor: UIColor?
    
    @discardableResult func setPlaceholder(holder: String) -> FormFieldTextOptions {
        placeholder = holder
        return self
    }
    
    @discardableResult func setReturnKeyType(type: UIReturnKeyType) -> FormFieldTextOptions {
        returnKeyType = type
        return self
    }
    
    @discardableResult func setAutoCorrectionType(type: UITextAutocorrectionType) -> FormFieldTextOptions {
        autoCorrectionType = type
        return self
    }
    
    @discardableResult func setAutoCapitalizationType(type: UITextAutocapitalizationType) -> FormFieldTextOptions {
        autoCapitalizationType = type
        return self
    }
    
    @discardableResult func setKeyboardType(type: UIKeyboardType) -> FormFieldTextOptions {
        keyboardType = type
        return self
    }
    
    @discardableResult func setIsSecure(secure: Bool) -> FormFieldTextOptions {
        isSecure = secure
        return self
    }
    
    @discardableResult func setBorderStyle(style: UITextField.BorderStyle) -> FormFieldTextOptions {
        borderStyle = style
        return self
    }
    
    @discardableResult func setTextColor(color: UIColor) -> FormFieldTextOptions {
        textColor = color
        return self
    }
    
    @discardableResult func setPlaceholderColor(color: UIColor) -> FormFieldTextOptions {
        placeholderColor = color
        return self
    }
}
