//
//  QPuzzle.swift
//  wordpop
//
//  Created by AhmetVural on 7.05.2022.
//

import SwiftUI

struct QPuzzle: Identifiable, Codable {
    var id: Int
    var eng: String
    var tr: String
    var es: String
    var fr: String
    var de: String
    var wrdtype: String  // Add the new property
    var wordlevel_id: Int  // Add the new property
    var jumbbledWord: String
    var answer: String
    var isLearned: Bool
    var isBlocked: Bool
    var isViewed: Bool
    
    // Jumbled wordu karakterlere bolme
    var letters: [QLetter] = []
    
    enum CodingKeys: String, CodingKey {
        case id, eng, tr, es, fr, de, wrdtype, wordlevel_id, jumbbledWord, answer, isLearned, isBlocked, isViewed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        tr = try container.decode(String.self, forKey: .tr)
        eng = try container.decode(String.self, forKey: .eng)
        es = try container.decode(String.self, forKey: .es)
        fr = try container.decode(String.self, forKey: .fr)
        de = try container.decode(String.self, forKey: .de)
        wrdtype = try container.decode(String.self, forKey: .wrdtype)
        wordlevel_id = try container.decode(Int.self, forKey: .wordlevel_id)
        jumbbledWord = try container.decode(String.self, forKey: .jumbbledWord)
        answer = try container.decode(String.self, forKey: .answer)
        isLearned = try container.decode(Bool.self, forKey: .isLearned)
        isBlocked = try container.decode(Bool.self, forKey: .isBlocked)
        isViewed = try container.decode(Bool.self, forKey: .isViewed)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(eng, forKey: .eng)
        try container.encode(tr, forKey: .tr)
        try container.encode(es, forKey: .es)
        try container.encode(fr, forKey: .fr)
        try container.encode(de, forKey: .de)
        try container.encode(wrdtype, forKey: .wrdtype)
        try container.encode(wordlevel_id, forKey: .wordlevel_id)
        try container.encode(jumbbledWord, forKey: .jumbbledWord)
        try container.encode(answer, forKey: .answer)
        try container.encode(isLearned, forKey: .isLearned)
        try container.encode(isBlocked, forKey: .isBlocked)
        try container.encode(isViewed, forKey: .isViewed)
    }
}

struct QLetter:  Identifiable{
    var id = UUID().uuidString
    var value:String
}

