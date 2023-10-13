//
//  WordRow.swift
//  wordpop
//
//  Created by AhmetVural on 1.12.2022.
//

import SwiftUI

struct WordRow: View {
    
    var gword:QPuzzle

    var body: some View {
        HStack {
                  
                   Text(gword.tr)
            

                   Spacer()
               }
    }
}

struct WordRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WordRow(gword: qpuzzles[0])
           
        }
               .previewLayout(.fixed(width: 300 * sizeScreenIphone(), height: 70 * sizeScreenIphone()))
        
    }
}
