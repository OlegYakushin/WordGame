//
//  OnBoarding.swift
//  wordpop
//
//  Created by AhmetVural on 11.05.2022.
//

import SwiftUI

struct OnBoarding: View {
    @EnvironmentObject var settings: ASettings
    @State private var isSettingViewPresented = false
    @State var offset:CGFloat = 0

    var body: some View {
        OffsetPageTabView(offset:$offset){
            HStack(spacing: 0){
                ForEach(boardingScreens){screen in
               
                    VStack(spacing:15 * sizeScreenIphone()){
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width-100, height: getScreenBounds().width-100)
                            .offset(y:-110 * sizeScreenIphone())
                        //small screen adomption
                            .scaleEffect(getScreenBounds().height < 750 ?  0.9 : 1)
                            .offset(y: getScreenBounds().height < 750 ?  -80 : -60)
                        VStack(alignment: .leading, spacing: 12 * sizeScreenIphone()){
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding(.top,20 * sizeScreenIphone())
                            
                            Text(screen.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }
                        .frame(maxWidth:.infinity , alignment: .leading)
                        .offset(y:-70 * sizeScreenIphone())
                    }
                    .padding()
                    .frame(width:getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                  //  .background(Color(screen.image))
                }
            }
       
        
        }
        //animation
            .background(
                RoundedRectangle(cornerRadius: 50 * sizeScreenIphone())
                    .fill(Color("background"))
                // size as image size
                    .frame(width: getScreenBounds().width-100, height: getScreenBounds().width-100)
                    .scaleEffect(2)
                    .rotationEffect(.init(degrees: 25))
                    .rotationEffect(.init(degrees:getRotation()))
                    .offset(y:-getScreenBounds().width + 20)
                ,alignment: .leading
                
            )
        .background(Color("screen\(getIndex()+1)")
                        .animation(.easeInOut, value: getIndex())
        )
        .ignoresSafeArea(.container,edges: .all)
        .overlay(
            VStack{
                HStack(spacing:25 * sizeScreenIphone()){
                    Button{
                        isSettingViewPresented.toggle()
                    }label:{
                        Text(LocalizedStringKey("Set up your learning language"))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(maxWidth:.infinity)
                            .background(Color("background"), in: RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                HStack{
                    Button{
                        settings.firstLaunch = false
                    } label: {
                        Text(LocalizedStringKey("Skip"))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    //indicatiorler
                    HStack(spacing:8 * sizeScreenIphone()){
                        ForEach(boardingScreens.indices, id: \.self){index in

                            Circle()
                                .fill(.white)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == (getIndex()) ? 1.3 : 0.85 )
                                .animation(.easeInOut, value : getIndex())
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    Button{
                        //setting mac offset
                        //max 4 screen 3x
                        offset = min(offset + getScreenBounds().width, getScreenBounds().width * 2)
                    } label: {
                        Text(LocalizedStringKey("Next"))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            
                    }
                }
                .padding(.top,30 * sizeScreenIphone())
                .padding(.horizontal, 8 * sizeScreenIphone())
                .sheet(isPresented: $isSettingViewPresented) {
                                SettingLanguage()
                            }
             
                
            }
            .padding() ,alignment: .bottom
        )
    }
    
    //get rotation
    func getRotation()->Double{
        let progress = offset / (getScreenBounds().width * 4)
                                 
         let rotation = Double(progress) * 360
        return rotation
    }
    
    //changin bg color based on ofset
    func getIndex()->Int{
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding().environmentObject(ASettings())
    }
}
//extension the view for screeen bound
extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
