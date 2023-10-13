//
//  ContentView.swift
//  wordpop
//
//  Created by AhmetVural on 27.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = ASettings()
    @AppStorage("firstLaunch") var firstlaunch: Bool = true
  
    var body: some View {
       
       // Home()
        if firstlaunch == true{
        
        OnBoarding()
            .environmentObject(settings)
            .onAppear{
                firstlaunch = false
            }
    
        } else {
            if settings.currentPage=="mainScreen"{
            MainView()
                .environmentObject(settings)
            }else if settings.currentPage=="gameScreen"{
                Home()
                    .environmentObject(settings)
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
