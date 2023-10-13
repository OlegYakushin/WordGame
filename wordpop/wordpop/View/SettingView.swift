//
//  SettingView.swift
//  wordpop
//
//  Created by AhmetVural on 5.05.2022.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var settings: ASettings
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
                    Text(LocalizedStringKey("Settings"))
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("dark"))
                        .padding(.vertical)
                
            }
                VStack{
                    Text(LocalizedStringKey("Language"))
                        .font(.title.bold())
                        .foregroundColor(Color("dark"))
                    
                        .padding(.vertical, 10 * sizeScreenIphone())
               
                    HStack{
                        VStack {
                            HStack{
                                Text(LocalizedStringKey("Native"))
                                    .font(.system(size: 20 * sizeScreenIphone(), weight: .medium))
                                    .foregroundColor(Color("dark"))
                             
                            }
                            Picker(selection: $settings.native, label: Text("Native"), content: {
                                Text("English 🇺🇸").tag(Language.english)
                                Text("Turkish 🇹🇷").tag(Language.turkish)
                                Text("Spanish 🇪🇸").tag(Language.spanish)
                                Text("French 🇫🇷").tag(Language.french)
                                Text("German 🇩🇪").tag(Language.german)
                                 
                                
                                
                            }
                                   
                            )
                            //.pickerStyle(WheelPickerStyle())
                            .accentColor((Color("dark")))
                            
                            .frame(height: 100 * sizeScreenIphone())
                           
                        }
                        
                        VStack {
                            HStack {
                                Text(LocalizedStringKey("Learning"))
                                
                                    .font(.system(size: 20 * sizeScreenIphone(), weight: .medium))
                                    .foregroundColor(Color("dark"))
                              
                            }
                            Picker(selection: $settings.learning, label: Text("Learning"), content: {
                                Text("English 🇺🇸").tag(Language.english)
                                Text("Turkish 🇹🇷").tag(Language.turkish)
                                Text("Spanish 🇪🇸").tag(Language.spanish)
                                Text("French 🇫🇷").tag(Language.french)
                                Text("German 🇩🇪").tag(Language.german)
                            })
                            
                           // .pickerStyle(WheelPickerStyle())
                            .accentColor((Color("dark")))
                            
                            .frame(height: 100 * sizeScreenIphone())
                            
                        }
                       
                    }
                   
                    Spacer()
                    
                }
                .padding()
                .frame(width: 370 * sizeScreenIphone(), height: 280 * sizeScreenIphone())
                .background(Color("yellow").opacity(0.5))
                .cornerRadius(20 * sizeScreenIphone())
                
                
                
                VStack{
                    Text(LocalizedStringKey("Level"))
                        .font(.title.bold())
                        .foregroundColor(Color("dark"))
                        
                        .padding(.vertical, 10 * sizeScreenIphone())
                    VStack{
                        
                        Text(LocalizedStringKey("Beginner"))
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 200 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .background(Color("dark"),in:RoundedRectangle(cornerRadius:15 * sizeScreenIphone()))
                        ZStack{
                            Text(LocalizedStringKey("Intermediate"))
                                .bold()
                                .blur(radius: 5)
                                .foregroundColor(.white)
                            Image(systemName: "lock")
                        }
                            .frame(width: 200 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .background(Color("gray"),in:RoundedRectangle(cornerRadius:15 * sizeScreenIphone()))
                        ZStack{
                            Text(LocalizedStringKey("Pro"))
                                .bold()
                                .blur(radius: 5)
                                .foregroundColor(.white)
                            Image(systemName: "lock")
                                
                               
                        }
                            .frame(width: 200 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .background(Color("gray"),in:RoundedRectangle(cornerRadius:15 * sizeScreenIphone()))
                    }
                   
                    
                    
                    Spacer()
                
                }
                .padding()
                
                .frame(width: 370 * sizeScreenIphone(), height: 280 * sizeScreenIphone())
                .background(Color("yellow").opacity(0.5))
                .cornerRadius(20 * sizeScreenIphone())
                .padding(.vertical, 30 * sizeScreenIphone())
                Spacer()
                
            }
            
          
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(ASettings())
    }
}
