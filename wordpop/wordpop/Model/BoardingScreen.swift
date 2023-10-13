//
//  BoardingScreen.swift
//  wordpop
//
//  Created by AhmetVural on 11.05.2022.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image:String
    var title:String
    var description:String
 
}

//same title
let title = "Easy payments with \nawallet"
let description = "small sdsdsssd  sdsdsds  sdsd \ndffff dfdfdfdf"

// sample model screens


var boardingScreens:[BoardingScreen] = [
    BoardingScreen(image: "screen1", title: title, description: description),
    BoardingScreen(image: "screen2", title: title, description: description),
    BoardingScreen(image: "screen3", title: title, description: description),
        

]
