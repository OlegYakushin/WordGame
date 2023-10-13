//
//  ViewedsView.swift
//  wordpop
//
//  Created by AhmetVural on 1.12.2022.
//

import SwiftUI

struct ViewedsView: View {
    @EnvironmentObject var settings:ASettings
  
    var filteredQpuzzles:[QPuzzle]{
        qpuzzles.filter{
            qpuzzle in (qpuzzle.isViewed)
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

struct ViewedsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewedsView()
    }
}
