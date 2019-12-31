//
//  FormFieldText.swift
//  MediumTextField
//
//  Created by Peter Ent on 12/31/19.
//  Copyright © 2019 Peter Ent. All rights reserved.
//

import SwiftUI

struct FormFieldText: UIViewRepresentable {
    
    var isResponder: Bool
    @Binding var text: String
    var options: FormFieldTextOptions
    var onCommit: (() -> Void)? = nil
    
    func makeUIView(context: UIViewRepresentableContext<FormFieldText>) -> UITextField {
        let uiView = UITextField()
        uiView.borderStyle = .roundedRect
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        uiView.delegate = context.coordinator
        uiView.returnKeyType = options.returnKeyType
        uiView.placeholder = options.placeholder
        uiView.autocorrectionType = options.autoCorrectionType
        uiView.autocapitalizationType = options.autoCapitalizationType
        uiView.keyboardType = options.keyboardType
        uiView.isSecureTextEntry = options.isSecure
        return uiView
    }
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<FormFieldText>) {
        if let local = uiView.text, local != self.text {
            uiView.text = self.text
        }
        
        if isResponder {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> FormFieldText.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FormFieldText
        
        init(_ parent: FormFieldText) {
            self.parent = parent
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // triggers the didEndEditing function
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.onCommit?()
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text {
                DispatchQueue.main.async {
                    self.parent.text = text
                }
            }
        }
    }
}
