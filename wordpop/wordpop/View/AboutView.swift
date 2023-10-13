//
//  AboutView.swift
//  wordpop
//
//  Created by AhmetVural on 29.11.2022.
//

import SwiftUI

struct AboutView: View {
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
                    Text("About")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("dark"))
                        .padding(.vertical)
                    
                    
                }
                Spacer()
            }
                VStack(spacing: 30){
                    Button{
                        
                        
                    }label:{
                        RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                            .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .foregroundColor(Color("dark"))
                            .overlay(
                                
                                
                                Text(LocalizedStringKey("About app"))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                
                                
                            )
                        
                    }
                    
                    Button{
                        
                        
                    }label:{
                        RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                            .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .foregroundColor(Color("dark"))
                            .overlay(
                                
                                
                                Text(LocalizedStringKey("Privacy Policy"))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                
                                
                            )
                        
                    }
                    Button{
                        
                        
                    }label:{
                        RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                            .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .foregroundColor(Color("dark"))
                            .overlay(
                                
                                
                                Text(LocalizedStringKey("Terms of use"))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                
                                
                            )
                        
                    
                }

              
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
