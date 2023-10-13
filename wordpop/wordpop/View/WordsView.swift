//
//  WordsView.swift
//  wordpop
//
//  Created by AhmetVural on 29.11.2022.
//

import SwiftUI

struct WordsView: View {
    @State private var selectedTab = 1
    @State private var showListOption = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
           
            Color("background")
                .ignoresSafeArea()
           
            
            VStack{
                ZStack{
                    HStack{
                        Button{
                            dismiss()
                            
                        }label:{
                            Image(systemName: "arrowshape.backward.fill")
                                .font(.title)
                                .foregroundColor(.cyan)
                            
                        }
                        .padding()
                        Spacer()
                    }
                    Text("Words")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("dark"))
                        .padding(.vertical)
                }
                    HStack{
                        Button(action: {
                            selectedTab = 1
                         
                        }) {
                            RoundedRectangle(cornerRadius: 20 * sizeScreenIphone())
                                .frame(width: 120 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                                .foregroundColor(selectedTab == 1 ? Color("orange") : Color("dark"))
                                .overlay(
                                 
                                       
                                            Text(LocalizedStringKey("Viewed"))
                                                .bold()
                                                .foregroundColor(.white)
                                       
                                    
                                    
                                )
                        }
                       
                            Button(action: {
                                selectedTab = 2
                               
                            }) {
                                RoundedRectangle(cornerRadius: 20 * sizeScreenIphone())
                                    .frame(width: 120 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                                    .foregroundColor(selectedTab == 2 ? Color("orange") : Color("dark"))
                                    .overlay(
                                        HStack{
                                            Text(LocalizedStringKey("Learned"))
                                                .bold()
                                                .foregroundColor(.white)
                                            
                                        }
                                        
                                    )
                            }
                            Button(action: {
                                selectedTab = 3
                               
                            }) {
                                RoundedRectangle(cornerRadius: 20 * sizeScreenIphone())
                                    .frame(width: 120 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                                    .foregroundColor(selectedTab == 3 ? Color("orange") : Color("dark"))
                                    .overlay(
                                        HStack{
                                            Text(LocalizedStringKey("Blocked"))
                                                .bold()
                                                .foregroundColor(.white)
                                            
                                        }
                                        
                                    )
                            }
                            
                        
                        
                    }
                
                
                if selectedTab == 1{
                    ViewedsView()
                }
                if selectedTab == 2{
                    LearnedsView()
                }
                if selectedTab == 3{
                    BlockListView()
                }
               
                
                
         
           
            }
        }
        .navigationBarBackButtonHidden(true)
      
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
