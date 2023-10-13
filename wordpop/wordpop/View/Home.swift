//
//  Home.swift
//  wordpop
//
//  Created by AhmetVural on 27.04.2022.
//

import SwiftUI
import AVFoundation


struct Home: View {
    @EnvironmentObject var settings:ASettings
    @Environment(\.dismiss) var dismiss
   // @State var currentPuzzle:Puzzle = puzzles[0]
  //  @State var selectedLetters:[Letter]=[]

    @State var currentQPuzzle:QPuzzle = qpuzzles[0]
    @State var selectedQLetters:[QLetter]=[]
    @State var currentPuzzleList:[QPuzzle]=[]
    @State var currentQIndex:Int = 0
    @State var showingPopupWrong = false // 1
    @State var showingPopupTrue = false // 1
    @State var showingPopupComplete = false // 1
    @State var progressValue: Float = 0.1
    @State var level: Int = 1
    @State var word: Int = 1
    let synth = AVSpeechSynthesizer()
    var body: some View {
       
        VStack{
           
            ProgressBar(value: $progressValue).frame(height: 30 * sizeScreenIphone())
                .overlay(
                    Text(LocalizedStringKey("Word \(word)/6"))
                        .fontWeight(.bold)
                       // .font(.title3)
                        .foregroundColor(Color("dark").opacity(0.5))
                )
             
            VStack{
                     
                HStack{
                    Button{
                  
                        settings.currentPage = "mainScreen"
                    }label:{
                        Image(systemName: "arrowshape.backward.fill")
                            .font(.title)
                            .foregroundColor(.cyan)
                        
                    }
                    Spacer()
                    Button{
                    
                      readWord()
                    }label:{
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title3)
                            .padding(10 * sizeScreenIphone())
                            .background(.cyan,in:Circle())
                            .foregroundColor(.white)
                        
                    }
                }
                .overlay{
                    HStack{
                        Text(LocalizedStringKey("Level \(level)"))
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(Color("dark"))
                     
                       
                       
                            
                    }
                            
                }
           
                    
                
                
              
                Text(currentQPuzzle.eng.uppercased())
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color("dark"))
                    
                //puzzle fill blanks
                
                HStack(spacing:10 * sizeScreenIphone()){
                    ForEach(0..<currentQPuzzle.answer.count,id:\.self){index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10 * sizeScreenIphone())
                                .fill(.blue.opacity(selectedQLetters.count > index ? 1 : 0.2))
                                .frame(height: 60 * sizeScreenIphone())
                            
                            //secili harfleri burada gosteriyoruz
                            if selectedQLetters.count > index{
                                Text(selectedQLetters[index].value)
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                }
            }
            .padding()
            .background(.white,in: RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
            //Custom Honeygrid
            //  HoneyCombGridView(items: currentPuzzle.letters)
            HoneyCombGridView(items: currentQPuzzle.letters)
            {item in
               
                ZStack{
                    HexagonShape()
                      //  .fill(isSelected(letter: item) ? .yellow : .white)
                        .fill(isQSelected(letter: item) ? .yellow : .white)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 10, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 8)
                
                    Text(item.value)
                        .font(.largeTitle)
                        .fontWeight(.black)
                  
                        .foregroundColor(isQSelected(letter: item) ? .white : .gray.opacity(0.5))
                }
                .contentShape(HexagonShape())
                .onTapGesture {
                    //adding letters
                    // addLetter(letter: item)
                    addQLetter(letter: item)
                }
               
                
            }
            
            //Next button
            Button{
                //yeni puzzle gecme
               // selectedLetters.removeAll()
               // currentPuzzle = puzzles[1]
                //generating leter
               // generateLetters()
                checkAndNewGame()
              
            } label:{
                Text(LocalizedStringKey("Check"))
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth:.infinity)
                    .background(Color("orange"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
            }
            .disabled(selectedQLetters.count != currentQPuzzle.answer.count)
            .opacity(selectedQLetters.count != currentQPuzzle.answer.count ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .top)
       // .background(.red)
        .background(Color("background"))
        .overlay(
            Color.black.opacity(showingPopupWrong || showingPopupTrue || showingPopupComplete ? 0.2 : 0)
        )
        .blur(radius: showingPopupWrong || showingPopupTrue || showingPopupComplete ? 10 : 0)
        
        .popup(isPresented: $showingPopupWrong,dismissCallback: wrongAnswer) {
                 ZStack {
                     Color("background")
                     ZStack{
                         VStack{
                             
                             Image(systemName: "xmark.circle")
                                 .resizable()
                                 .frame(width: 80, height: 80)
                                 .foregroundColor(Color("orange"))
                             Text(LocalizedStringKey("Wrong!"))
                                 .font(.title.bold())
                                 .foregroundColor(Color("orange"))
                                 .padding()
                         }
                         VStack{
                             Spacer()
                             Text(LocalizedStringKey("Let's try again"))
                                 .font(.title3.bold())
                                 .foregroundColor(Color("orange"))
                                 .padding()
                         }
                     }
                     .padding()
                 }
                 .frame(width: 300 * sizeScreenIphone(), height: 300 * sizeScreenIphone())
                 .cornerRadius(20 * sizeScreenIphone())
             }
        .popup(isPresented: $showingPopupTrue,dismissCallback: rightAnswer) { // 3
                 ZStack { // 4
                     Color("background")
                     VStack{
                         Spacer()
                         Image(systemName: "checkmark.circle")
                             .resizable()
                             .frame(width: 80, height: 80)
                        
                             .foregroundColor(Color("green"))
                       
                         Text(LocalizedStringKey("True!"))
                             .font(.title.bold())
                             .foregroundColor(Color("green"))
                         Spacer()
                         Button{
                             addLearned()
                         } label:{
                             Text(LocalizedStringKey("Add to learned"))
                                 .font(.title3.bold())
                                 .foregroundColor(.white)
                                 .padding(.vertical)
                                 .frame(maxWidth:200 * sizeScreenIphone())
                                 .background(Color("green"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                         }
                         
                         Button{
                             addBlacklist()
                         } label:{
                             Text(LocalizedStringKey("Add to blacklist"))
                                     .font(.title3.bold())
                                     .foregroundColor(Color("orange"))
                                     .padding(.vertical)
                                     .frame(maxWidth: 200 * sizeScreenIphone())
                                     .overlay(
                                         RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                                             .strokeBorder(Color("orange"), lineWidth: 2)
                                     )
                         }
                        
                         
                         
                 }
                     .padding()
                 }
                 .frame(width: 300 * sizeScreenIphone(), height: 400 * sizeScreenIphone())
                 .cornerRadius(20 * sizeScreenIphone())
             }
        .popup(isPresented: $showingPopupComplete,dismissCallback: winQuiz) { // 3
            ZStack { // 4
                Color("background")
                VStack{
                    Spacer()
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                        .foregroundColor(Color("green"))
                    
                    Text(LocalizedStringKey("Win!"))
                        .font(.title.bold())
                        .foregroundColor(Color("green"))
                    Spacer()
                    Button{
                       
                        settings.currentPage="gameScreen"
                        currentQIndex = 0
                        currentQPuzzle = currentPuzzleList[currentQIndex]
                        selectedQLetters.removeAll()
                        progressValue = 0.1
                        word = 1
                        getRandomElementsFromArray()
                        generateAnsLetters()
                        
                    } label:{
                        Text(LocalizedStringKey("Next level"))
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth:200 * sizeScreenIphone())
                            .background(Color("green"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    }
                    Button{
                       
                        settings.currentPage = "mainScreen"
                       
                        
                    } label:{
                        Text(LocalizedStringKey("End game"))
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth:200 * sizeScreenIphone())
                            .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    }
                   
                    Button{
                        addLearned()
                    } label:{
                        Text(LocalizedStringKey("Add to learned"))
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth:200 * sizeScreenIphone())
                            .background(Color("yellow"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    }
                    
                    Button{
                        addBlacklist()
                    } label:{
                        Text(LocalizedStringKey("Add to blacklist"))
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth:200 * sizeScreenIphone())
                            .overlay(
                                RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                                    .strokeBorder(Color("orange"), lineWidth: 2)
                            )
                    }
                    
                
                    
            }
                .padding()
            }
            .frame(width: 300 * sizeScreenIphone(), height: 500 * sizeScreenIphone())
            .cornerRadius(20 * sizeScreenIphone())
             }
        .onAppear{
          //  generateLetters()
            getRandomElementsFromArray()
            generateAnsLetters()
            print("lerneds:",settings.learneds)
            print("viewed:",settings.viewed)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .environmentObject(settings)
    }
    /*
    func addLetter(letter:Letter){
        withAnimation{
            if isSelected(letter: letter){
                //varsa kaldir
                 selectedLetters.removeAll{currentLetter in
                    return currentLetter.id == letter.id
                    
                }
            }else{
                if selectedLetters.count == currentPuzzle.answer.count{return}
                selectedLetters.append(letter)
            }
           
        }
        
    }
   
    */
    func addLearned(){
        print("Add to learned")
        if !settings.learneds.contains(currentQPuzzle.id) {
            settings.learneds.append(currentQPuzzle.id)
          }
        
        level = settings.learneds.count / 60 + 1
    }
    func addBlacklist(){
        print("Add to blacklist")
        if !settings.blacklist.contains(currentQPuzzle.id) {
            settings.blacklist.append(currentQPuzzle.id)
          }
        
      }
    func wrongAnswer(){
        print("wrong answer")
        selectedQLetters.removeAll()

    }
    func rightAnswer(){
        print("rght answer")
        currentQIndex += 1
        progressValue = (Float(currentQIndex)+1) * (1/6)
        currentQPuzzle = currentPuzzleList[currentQIndex]
        selectedQLetters.removeAll()
        generateAnsLetters()
        word += 1
        
    }
    func winQuiz(){
        print("win quiz")
       // settings.currentPage = "mainScreen"
        level += 1
       
    }
    //
    
    func getRandomElementsFromArray(){
        var resultSet:[QPuzzle] = []

        while resultSet.count < 6 {
            let randomIndex = Int(arc4random_uniform(UInt32(qpuzzles.count)))
            if !settings.blacklist.contains(qpuzzles[randomIndex].id) {
              
              //  print("current resultset",resultSet)
                if !resultSet.contains(where: {$0.id==randomIndex}) {
                
                resultSet.insert(qpuzzles[randomIndex], at: 0)
                }
            }
        }

            let resultArray = Array(resultSet)
            currentPuzzleList = resultArray.shuffled()
            currentQPuzzle = currentPuzzleList[currentQIndex]
        print("current black list",settings.blacklist)
        print("current learned list",settings.learneds)
      
            print("current pz list",currentPuzzleList)
    }
    func readWord(){
        let string = currentQPuzzle.eng
          let utterance = AVSpeechUtterance(string: string)
          utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

          
          synth.speak(utterance)
        
    }
    func checkAndNewGame(){
        if !settings.viewed.contains(currentQPuzzle.id) {
            settings.viewed.append(currentQPuzzle.id)
          }
       
        print("viewed:",settings.viewed)
        var tmpstrforchck = ""
        selectedQLetters.forEach{lt in
            tmpstrforchck = tmpstrforchck + lt.value
        }
        //tmpstrforchck=tmpstrforchck.lowercased()
       // currentQPuzzle.tr = currentQPuzzle.tr.lowercased()
        print("wrd",tmpstrforchck)
        if tmpstrforchck.compare(currentQPuzzle.tr, options: .caseInsensitive) == .orderedSame {
            // dogru
            print("dogru")
            if currentQIndex<currentPuzzleList.count-1{
                showingPopupTrue = true
            }else{
                print("quiz bitti")
                showingPopupComplete = true
            }
            
        }else{
            print("yanlis")
            showingPopupWrong = true
        }
       
    }
    
    func addQLetter(letter:QLetter){
        withAnimation{
            if isQSelected(letter: letter){
                //varsa kaldir
                 selectedQLetters.removeAll{currentLetter in
                    return currentLetter.id == letter.id
                    
                }
            }else{
                if selectedQLetters.count == currentQPuzzle.answer.count{return}
                selectedQLetters.append(letter)
            }
           
        }
        
    }
    func isQSelected(letter:QLetter)->Bool{
        return selectedQLetters.contains{currentLetter in
            return currentLetter.id == letter.id
            
        }
    }
    //
    //zaten eklimi diye bakalim
    /*
    func isSelected(letter:Letter)->Bool{
        return selectedLetters.contains{currentLetter in
            return currentLetter.id == letter.id
            
        }
    }
    func generateLetters(){
        currentPuzzle.jumbbledWord.forEach{character in currentPuzzle.letters.append(Letter(value: String(character)))
        }
        
    }
    */
    func generateAnsLetters(){
        currentQPuzzle.answer = currentQPuzzle.tr
        let tempstr = randomString(length: 3)
        currentQPuzzle.jumbbledWord = currentQPuzzle.tr + tempstr
        print("curr",currentQPuzzle.jumbbledWord)
        currentQPuzzle.jumbbledWord = currentQPuzzle.jumbbledWord.uppercased()
        currentQPuzzle.jumbbledWord.forEach{character in currentQPuzzle.letters.append(QLetter(value: String(character)))
        }
        currentQPuzzle.letters.shuffle()
        print("currjum",currentQPuzzle.letters)
        
    }
    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ASettings())
    }
}

