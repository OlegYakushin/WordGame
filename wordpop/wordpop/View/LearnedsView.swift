//
//  LearnedsView.swift
//  wordpop
//
//  Created by AhmetVural on 1.12.2022.
//

import SwiftUI
extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }


    }
}



struct LearnedsView: View {
    @EnvironmentObject var settings:ASettings
    
    var filteredQpuzzles:[QPuzzle]{
        qpuzzles.filter{
            qpuzzle in (qpuzzle.isLearned)
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

struct LearnedsView_Previews: PreviewProvider {
    static var previews: some View {
        LearnedsView()
    }
}
