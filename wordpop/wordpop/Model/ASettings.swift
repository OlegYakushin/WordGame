//
//  ASettings.swift
//  wordpop
//
//  Created by AhmetVural on 5.05.2022.
//

import Foundation

enum Language: Int{
    case english = 0
    case turkish = 1
    case spanish = 2
    case french = 3
    case german = 4
}



class ASettings: ObservableObject {
    
    @Published var firstLaunch: Bool {
        didSet {
            UserDefaults.standard.set(firstLaunch,forKey: "fistLaunch")
        }
    }
    @Published var currentPage: String {
        didSet {
            UserDefaults.standard.set(currentPage,forKey: "currentPage")
        }
    }
    @Published var native: Language{
        didSet {
                    UserDefaults.standard.set(native.rawValue, forKey: "native")
                }
    }
    @Published var learning: Language{
        didSet {
                    UserDefaults.standard.set(learning.rawValue, forKey: "learning")
                }
    }
    @Published var  learneds:[Int]{
        didSet {
                    UserDefaults.standard.set(learneds, forKey: "learneds")
                }
    }
    @Published var  viewed:[Int]{
        didSet {
                    UserDefaults.standard.set(viewed, forKey: "viewed")
                }
    }
    @Published var  blacklist:[Int]{
        didSet {
                    UserDefaults.standard.set(viewed, forKey: "blacklist")
                }
    }
    init() {
          /*
             Here we load the data from user default, so that the proper temperature and speed units
             are available the moment the app loads and this class is instantiated.
          */
          self.native = (UserDefaults.standard.object(forKey: "native") == nil ? Language.english : Language(rawValue: UserDefaults.standard.object(forKey: "native") as! Int)) ?? Language.english
        
            self.learning = (UserDefaults.standard.object(forKey: "learning") == nil ? Language.turkish : Language(rawValue: UserDefaults.standard.object(forKey: "learning") as! Int)) ?? Language.turkish
            
        self.learneds = (UserDefaults.standard.object(forKey: "learneds") == nil ? []: UserDefaults.standard.object(forKey: "learneds") as! [Int])
        
        self.viewed = (UserDefaults.standard.object(forKey: "viewed") == nil ? []: UserDefaults.standard.object(forKey: "viewed") as! [Int])
        self.blacklist = (UserDefaults.standard.object(forKey: "blacklist") == nil ? []: UserDefaults.standard.object(forKey: "blacklist") as! [Int]) 
   
       
        self.firstLaunch = (UserDefaults.standard.object(forKey: "firstLaunch") == nil ? true: UserDefaults.standard.object(forKey: "firstLaunch") as! Bool)
        
        self.currentPage = (UserDefaults.standard.object(forKey: "currentPage") == nil ? "mainScreen": UserDefaults.standard.object(forKey: "currentPage") as! String)

                }
            
}
