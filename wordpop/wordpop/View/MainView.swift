//
//  MainView.swift
//  wordpop
//
//  Created by AhmetVural on 30.04.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var settings: ASettings
    @State var showSheet: Bool = false
    @State var showSheetLevel: Bool = false
    @State private var flag = ["🇺🇸","🇹🇷","🇪🇸","🇫🇷","🇩🇪"]

    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Image(systemName: "book")
                            .font(.title3.bold())
                            .foregroundColor(Color("dark"))
                        Text(String(settings.learneds.count))
                            .font(.title3.bold())
                            .foregroundColor(Color("dark"))
                    }
                    .frame(width: 60,height: 60)
                  
                    .cornerRadius(15 * sizeScreenIphone())
                    
                    Spacer()
                    HStack{
                        
                        
                        Spacer()
                        
                        Button{
                            //  showSheet.toggle()
                            
                        } label:{
                            VStack{
                                Text("\(flag[settings.native.rawValue])")
                                    .font(.largeTitle)
                                  
                                
                                   
                                
                                
                                
                            }
                            .frame(width: 50 * sizeScreenIphone(),height: 50 * sizeScreenIphone())
                            .background(Color.clear,in:RoundedRectangle(cornerRadius:25 * sizeScreenIphone()))
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.forward")
                            .font(.title.bold())
                            .foregroundColor(Color("dark"))
                        
                        Spacer()
                        
                        Button{
                            
                            // showSheetLevel.toggle()
                        } label:{
                            VStack{
                                Text("\(flag[settings.learning.rawValue])")
                                
                                    .font(.largeTitle)
                                    
                                    
                                
                                
                                
                            }
                            .frame(width: 50 * sizeScreenIphone(),height: 50 * sizeScreenIphone())
                            .background(Color.clear,in:RoundedRectangle(cornerRadius:25 * sizeScreenIphone()))
                        }
                Spacer()
                    }
                    VStack {
                        Image(systemName: "eye")
                            .font(.title3.bold())
                           // .background(Color("orange"))
                        Text(String(settings.viewed.count))
                            .font(.title3.bold())
                            .foregroundColor(Color("dark"))
                    }
                    .frame(width: 60,height: 60)
                   // .background(Color("orange"))
                    .cornerRadius(15 * sizeScreenIphone())
                  
                }
                
                
               
                  .padding(.horizontal)
                Spacer()
                
                
                Image("Logo")
                    .resizable()
                    .frame(width: 200 * sizeScreenIphone(),height: 200 * sizeScreenIphone())
                
                    .padding()
                // Spacer()
                VStack(spacing: 20){
                    Button{
                        settings.currentPage="gameScreen"
                        
                    } label:{
                        Text("Start")
                        .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                            .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                        
                        
                    }
                    
                    
                    NavigationLink(destination:WordsView()){
                        Text("Words")
                        
                    }
                    .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                  .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    
                    NavigationLink(destination:SettingView()){
                        Text("Settings")
                    }
                    .frame(width: 300 * sizeScreenIphone(), height: 50 * sizeScreenIphone())
                   .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    
                    NavigationLink(destination:AccountView()){
                        Text("Account")
                    }
                    .frame(width: 300 * sizeScreenIphone(),height: 50 * sizeScreenIphone())
                   .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    NavigationLink(destination:AboutView()){
                        Text("About")
                    }
                    .frame(width: 300 * sizeScreenIphone(),height: 50 * sizeScreenIphone())
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    
                }
            }
    .background(Color("background"))
       
        
    }
        
        .environmentObject(settings)
        
        /*
        .halfSheet(showSheet:$showSheet){
            //your half sheet view
            ZStack{
                Color.red
                VStack{
                    Text("Dil secimi")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Button {
                        showSheet.toggle()
                    }
                    label:{
                        Text("Close")
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("Native")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        Picker(selection: $settings.native, label: Text("Native"), content: {
                            Text("English 🇺🇸").tag(Language.english)
                            Text("Turkce ").tag(Language.turkish)
                            Text("spanish 🇺🇸").tag(Language.spanish)
                            Text("french 🇺🇸").tag(Language.french)
                            Text("german 🇺🇸").tag(Language.german)
                      
                      
                      })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.top, 20)
                    VStack {
                        HStack {
                            Text("Learning")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        Picker(selection: $settings.learning, label: Text("Learning"), content: {
                            Text("English 🇺🇸").tag(Language.english)
                            Text("Turkce ").tag(Language.turkish)
                            Text("spanish 🇺🇸").tag(Language.spanish)
                            Text("french 🇺🇸").tag(Language.french)
                            Text("german 🇺🇸").tag(Language.german)
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.top, 20)
                    
                          //
                 
                }
                .padding([.leading, .trailing], 12)
                //
                  
                
                //
            }
            .ignoresSafeArea()
        }
        onEnd:{
            print("dismissed")
        }
        .halfSheet(showSheet:$showSheetLevel){
            //your half sheet view
            ZStack{
                Color.blue
                VStack{
                    Text("level secimi")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Button {
                        showSheetLevel.toggle()
                    }
                    label:{
                        Text("Close")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
            }
            .ignoresSafeArea()
        } onEnd:{
            print("dismissed")
        }
        */
    }
  
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ASettings())
    }
}

//custom halsheet modifier

extension View{
    
    func halfSheet<SheetView: View> (showSheet:Binding<Bool>, @ViewBuilder sheetView:@escaping ()->SheetView,onEnd:@escaping ()->())->some View{
        
        //why we using overlay
        //bcz it will auto use swifitui frame size
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet, onEnd: onEnd)
            )
    }
}

//uikkit integration
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd:()->()
    
    let controller = UIViewController()
   
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
       
        controller.view.backgroundColor = .clear
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet{
            //presenting modal view
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        }else{
            // closing view when
            uiViewController.dismiss(animated: true)
        }
    }
    //on dismiss
    class Coordinator: NSObject, UISheetPresentationControllerDelegate{
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
             
            parent.onEnd()
        }
    }
}

//custom uihostingcontroller
class CustomHostingController<Content: View>: UIHostingController<Content>{
    
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        //setting presentation controller properties
        if let presentationController = presentationController as?
            UISheetPresentationController{
            presentationController.detents = [
                .medium(),
                .large()
            ]
            //to show grab protion
            presentationController.prefersGrabberVisible = true
            
        }
    }
    
}


