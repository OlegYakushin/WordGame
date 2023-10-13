//
//  SettingLanguage.swift
//  wordpop
//
//  Created by Oleg Yakushin on 9/28/23.
//

import SwiftUI

struct SettingLanguage: View {
    @EnvironmentObject var settings: ASettings
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Text("Before we start,")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("dark"))
                       
                    
                    Text("let's choose a language!")
                    
                        .font(.title.bold())
                        .foregroundColor(Color("dark"))
                       
                }
                .padding()
                    
           Spacer(minLength: 50)
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
                            
                            
                        })
                        .pickerStyle(WheelPickerStyle())
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
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 100 * sizeScreenIphone())
                    }
                   
                }
                Spacer(minLength: 50)
                
                Button{
                    settings.firstLaunch = false
                    
                }label:{
                  Text("Start")
                        .font(.title3.bold())
                        .foregroundColor(Color.white)
                        .frame(width: 200,height: 50)
                       
                        .background(Color("green"))
                        .cornerRadius(15)
                    
                }
                .padding()
                Spacer()
                
            }
            .padding()
           
     
        }
    }
}

#Preview {
    SettingLanguage().environmentObject(ASettings())
}
