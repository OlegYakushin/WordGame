//
//  AddRemoveButton.swift
//  wordpop
//
//  Created by AhmetVural on 2.12.2022.
//

import SwiftUI

struct LearnedButton: View {
    @Binding var isSet: Bool

       var body: some View {
           Button {
               isSet.toggle()
           } label: {
               Label("Toggle learned", systemImage: isSet ? "star.fill" : "star")
                   .labelStyle(.iconOnly)
                   .foregroundColor(isSet ? Color("yellow") : Color("gray"))
           }
       }
}

struct LearnedButton_Previews: PreviewProvider {
    static var previews: some View {
        LearnedButton(isSet: .constant(true))
    }
}
