//
//  BlockListView.swift
//  wordpop
//
//  Created by AhmetVural on 1.12.2022.
//

import SwiftUI


struct BlockListView: View {
    @EnvironmentObject var settings:ASettings
    
    var filteredQpuzzles:[QPuzzle]{
        qpuzzles.filter{
            qpuzzle in (qpuzzle.isBlocked)
        }
    }
    init() {
            UICollectionView.appearance().backgroundColor = .clear
        }
    var body: some View {
        
        ZStack{
            Color("background")
                .ignoresSafeArea()
            List(filteredQpuzzles) { qpuzzle in
                
                NavigationLink {
                    WordDetail(qpuzzle:qpuzzle)
                } label: {
                    WordRow(gword: qpuzzle)
                }
                
                
            }
          
        }
    }
}

struct BlockListView_Previews: PreviewProvider {
    static var previews: some View {
        BlockListView()
    }
}
