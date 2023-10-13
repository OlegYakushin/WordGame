//
//  BlockListButton.swift
//  wordpop
//
//  Created by Ahmet Vural on 13.01.2023.
//


import SwiftUI

struct BlockListButton: View {
    @Binding var isSet: Bool

       var body: some View {
           Button {
               isSet.toggle()
           } label: {
               Label("Toggle block", systemImage: isSet ? "nosign.app.fill" : "nosign.app")
                   .labelStyle(.iconOnly)
                   .font(.system(size: 35))
                   .foregroundColor(isSet ? Color.red : Color.cyan)
           }
       }
}

struct BlockListButton_Previews: PreviewProvider {
    static var previews: some View {
        BlockListButton(isSet: .constant(true))
    }
}
