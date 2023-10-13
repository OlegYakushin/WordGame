//
//  AccountView.swift
//  wordpop
//
//  Created by AhmetVural on 28.11.2022.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var settings: ASettings
    @Environment(\.dismiss) var dismiss
    @State private var flag = ["🇺🇸","🇹🇷","🇪🇸","🇫🇷","🇩🇪"]
    @State private var isImagePickerPresented = false
    @State private var userImage: UIImage?
  
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack{
                ZStack{
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
                    Text("Account")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("dark"))
                        .padding(.vertical)
                }
                if let img = userImage {
                                   Image(uiImage: img)
                                       .resizable()
                                       .frame(width: 120, height: 120)
                                       .clipShape(Circle())
                                       .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .offset(x:50,y: 50)
                                            .onTapGesture {
                                                isImagePickerPresented = true
                                            }
                                       )
                               } else {
                                   Image(systemName: "person.crop.circle")
                                       .resizable()
                                       .frame(width: 120, height: 120)
                                       .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color("dark"))
                                            .offset(x:50,y: 50)
                                        
                                            .onTapGesture {
                                                isImagePickerPresented = true
                                            }
                                       )
                                       
                               }
                Spacer()
            }
                
            VStack(spacing: 30) {
                HStack{
                    Text("Your Level")
                        .font(.title3.bold())
                    Spacer()
                    Text("Begginer")
                        .font(.title3.bold())
                }
                .padding()
                    .frame(width: 350 * sizeScreenIphone(),height: 70 * sizeScreenIphone())
                   
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                
                
                    HStack{
                        Text("Your Learned")
                            .font(.title3.bold())
                        Spacer()
                        Text(String(settings.learneds.count))
                            .font(.title3.bold())
                       
                    }
                    .padding()
                    .frame(width: 350 * sizeScreenIphone(),height: 70 * sizeScreenIphone())
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                    HStack{
                        Text("Your Viewed")
                            .font(.title3.bold())
                        Spacer()
                        Text(String(settings.viewed.count))
                            .font(.title3.bold())
                        
                    }
                    .padding()
                    .frame(width: 350 * sizeScreenIphone(),height: 70 * sizeScreenIphone())
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .background(Color("dark"),in:RoundedRectangle(cornerRadius: 15 * sizeScreenIphone()))
                }

               
            
    }
        .onAppear {
                if let savedImageData = UserDefaults.standard.data(forKey: "userImage") {
                    userImage = UIImage(data: savedImageData)
                }
            }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isImagePickerPresented, content: {
                       ImagePicker(selectedImage: $userImage, sourceType: .photoLibrary)
                   })
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image

            
                if let imageData = image.jpegData(compressionQuality: 1.0) {
                    UserDefaults.standard.set(imageData, forKey: "userImage")
                    UserDefaults.standard.synchronize()
                }
            }
            picker.dismiss(animated: true)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(ASettings())
    }
}
