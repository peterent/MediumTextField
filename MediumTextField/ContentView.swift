//
//  ContentView.swift
//  MediumTextField
//
//  Created by Peter Ent on 12/31/19.
//  Copyright © 2019 Peter Ent. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var emailAddress: String = ""
    
    @State var currentField: Int = 0 // set to -1 if you do not want the keyboard to appear immediately
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var nickName: String = ""
    
    @State var firstNameOptions = FormFieldTextOptions()
        .setPlaceholder(holder: "First Name")
        .setReturnKeyType(type: .next)
        .setAutoCapitalizationType(type: .words)
    
    @State var lastNameOptions = FormFieldTextOptions()
        .setPlaceholder(holder: "Last Name")
        .setReturnKeyType(type: .next)
        .setAutoCapitalizationType(type: .words)
    
    @State var nickNameOptions = FormFieldTextOptions()
        .setPlaceholder(holder: "Nickname")
        .setReturnKeyType(type: .done)
        .setAutoCapitalizationType(type: .words)
    
    var body: some View {
        VStack {
            TextField("Email Address", text: self.$emailAddress) {
                // code to handle the commit
            }
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            
            FormFieldText(isResponder: 0 == self.currentField, text: self.$firstName, options: self.firstNameOptions) {
                self.currentField = 1
            }
            FormFieldText(isResponder: 1 == self.currentField, text: self.$lastName, options: self.lastNameOptions) {
                self.currentField = 2
            }
            FormFieldText(isResponder: 2 == self.currentField, text: self.$nickName, options: self.nickNameOptions) {
                // submit this form
            }
            
            Text(self.firstName) + Text(" ") + Text(self.lastName) + Text(" aka: ") + Text(self.nickName)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
