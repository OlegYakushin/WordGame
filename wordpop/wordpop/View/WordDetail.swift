//
//  WordDetail.swift
//  wordpop
//
//  Created by AhmetVural on 1.12.2022.
//

import SwiftUI
import AVFoundation

struct WordDetail: View {
    var qpuzzle: QPuzzle
    @EnvironmentObject var settings:ASettings
    @Environment(\.dismiss) var dismiss
    let synthesizer = AVSpeechSynthesizer()
 
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack{
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
            
                VStack(alignment: .leading){
                    HStack {
                        Text("🇹🇷")
                            .font(.title)
                        Text(qpuzzle.tr.capitalized)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button{
                        
                            speakWordTR(word: qpuzzle.tr)
                        }label:{
                            Image(systemName: "speaker.wave.2.fill")
                               
                                .padding(10 * sizeScreenIphone())
                                .background(.cyan,in:Circle())
                                .foregroundColor(.white)
                            
                        }
                    
                        //LearnedButton(isSet:.constant(qpuzzle.isLearned))
                        BlockListButton(isSet:.constant(qpuzzle.isBlocked))
                     //   ViewedButton(isSet:.constant(qpuzzle.isViewed))
                       
                        
                     
                       
                        
                      
                        
                    }
                    .padding()
                    HStack{
                        Text("🇩🇪")
                            .font(.title)
                        Text(qpuzzle.de.capitalized)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button{
                        
                            speakWordDE(word: qpuzzle.de)
                        }label:{
                            Image(systemName: "speaker.wave.2.fill")
                               
                                .padding(10 * sizeScreenIphone())
                                .background(.cyan,in:Circle())
                                .foregroundColor(.white)
                            
                        }
                       // LearnedButton(isSet:.constant(qpuzzle.isLearned))
                        BlockListButton(isSet:.constant(qpuzzle.isBlocked))
                      //  ViewedButton(isSet:.constant(qpuzzle.isViewed))
                    }
                    .padding()
                    HStack{
                        Text("🇺🇸")
                            .font(.title)
                        Text(qpuzzle.eng.capitalized)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button{
                        
                            speakWord(word: qpuzzle.eng)
                        }label:{
                            Image(systemName: "speaker.wave.2.fill")
                               
                                .padding(10 * sizeScreenIphone())
                                .background(.cyan,in:Circle())
                                .foregroundColor(.white)
                            
                        }
                       // LearnedButton(isSet:.constant(qpuzzle.isLearned))
                        BlockListButton(isSet:.constant(qpuzzle.isBlocked))
                       // ViewedButton(isSet:.constant(qpuzzle.isViewed))
                    }
                    .padding()
                    HStack{
                        Text("🇪🇸")
                            .font(.title)
                        Text(qpuzzle.es.capitalized)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button{
                        
                            speakWordES(word: qpuzzle.es)
                        }label:{
                            Image(systemName: "speaker.wave.2.fill")
                               
                                .padding(10 * sizeScreenIphone())
                                .background(.cyan,in:Circle())
                                .foregroundColor(.white)
                            
                        }
                        
                      //  LearnedButton(isSet:.constant(qpuzzle.isLearned))
                        BlockListButton(isSet:.constant(qpuzzle.isBlocked))
                     //   ViewedButton(isSet:.constant(qpuzzle.isViewed))
                    }
                    .padding()
                    HStack{
                        Text("🇫🇷")
                            .font(.title)
                        Text(qpuzzle.fr.capitalized)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button{
                        
                            speakWordFR(word: qpuzzle.fr)
                        }label:{
                            Image(systemName: "speaker.wave.2.fill")
                               
                                .padding(10 * sizeScreenIphone())
                                .background(.cyan,in:Circle())
                                .foregroundColor(.white)
                            
                        }
                      //  LearnedButton(isSet:.constant(qpuzzle.isLearned))
                        BlockListButton(isSet:.constant(qpuzzle.isBlocked))
                       // ViewedButton(isSet:.constant(qpuzzle.isViewed))
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private func speakWord(word: String) {
         let speechUtterance = AVSpeechUtterance(string: word)
         speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
         synthesizer.speak(speechUtterance)
     }
    private func speakWordTR(word: String) {
         let speechUtterance = AVSpeechUtterance(string: word)
         speechUtterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")
         synthesizer.speak(speechUtterance)
     }
    private func speakWordES(word: String) {
         let speechUtterance = AVSpeechUtterance(string: word)
         speechUtterance.voice = AVSpeechSynthesisVoice(language: "es-ES")
         synthesizer.speak(speechUtterance)
     }
    private func speakWordFR(word: String) {
         let speechUtterance = AVSpeechUtterance(string: word)
         speechUtterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
         synthesizer.speak(speechUtterance)
     }
    private func speakWordDE(word: String) {
         let speechUtterance = AVSpeechUtterance(string: word)
         speechUtterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
         synthesizer.speak(speechUtterance)
     }
}

struct WordDetail_Previews: PreviewProvider {
    static var previews: some View {
        WordDetail(qpuzzle: qpuzzles[0])
    }
}
