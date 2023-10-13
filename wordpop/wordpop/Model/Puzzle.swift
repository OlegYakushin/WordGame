//
//  Puzzle.swift
//  wordpop
//
//  Created by AhmetVural on 27.04.2022.
//

import SwiftUI

//Puzzle model and sample puzzles

struct Puzzle: Identifiable{
    var id:String = UUID().uuidString
    var imageName:String
    var answer:String
    var jumbbledWord:String
    
    //jumled wordu karakterlere bolme
    var letters:[Letter]=[]
    
}
struct Letter: Identifiable{
    var id = UUID().uuidString
    var value:String
}
var puzzles: [Puzzle] = [
        Puzzle(imageName: "Monkey", answer: "Monkey", jumbbledWord: "KOYMNZHDDHKDE"),
        Puzzle(imageName: "Clown", answer: "Clown", jumbbledWord: "ROCOLANWA")


]
