//
//  ViewedButton.swift
//  wordpop
//
//  Created by Ahmet Vural on 13.01.2023.
//

import SwiftUI

struct ViewedButton: View {
    @Binding var isSet: Bool

       var body: some View {
           Button {
               isSet.toggle()
           } label: {
               Label("Toggle viewed", systemImage: isSet ? "square.and.pencil" : "square")
                   .labelStyle(.iconOnly)
                   .foregroundColor(isSet ? Color("yellow") : Color("gray"))
           }
       }
}

struct ViewedButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewedButton(isSet: .constant(true))
    }
}
