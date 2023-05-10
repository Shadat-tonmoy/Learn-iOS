//
//  SwiftUIFileManagerTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/9/23.
//

import SwiftUI


class LocalFileManager : NSObject {
    
    static let instance = LocalFileManager()
    
    func saveToFileManager(image : UIImage, name : String) {
        guard
            let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Error getting data from image")
            return
        }
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let pictureDirectory = try? FileManager.default.url(for: .picturesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        
        let tempDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        
        print("Document : \(documentDirectory)")
        print("Picture : \(pictureDirectory)")
        print("Temp : \(tempDirectory)")
        
        guard
            let pathUrl = pictureDirectory?.appendingPathComponent(name, conformingTo: .image).appendingPathExtension("png") else {
            print("Invalid image path")
            return
        }
        let path = pathUrl.path
        
        if (FileManager.default.fileExists(atPath: path) == false){
            let fileCreationResult = FileManager.default.createFile(atPath: path, contents: nil)
            print("File creation result : \(fileCreationResult)")
            
        }
        
        print("Path to save image : \(path)")
        
//        FileManager.default.createFile(atPath: path.absoluteString, contents: nil)
        
        do {
            try imageData.write(to: pathUrl)
            print("Successfully Save Image at : \(path)")
            
        } catch let error {
            print("Error is saving image : \(error)")
        }
        
//        imageData.write(to: URL(from: <#T##Decoder#>))
        
    }
    
    func saveImageToGallery(image : UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            print("Save finished!")
        }
}

class SwiftUIFileManagerViewModel : ObservableObject{
    
    @Published var image : UIImage? = nil
    private let imageName : String = "vc"
    
    init(){
        print("Init called")
        getImageFromAsset()
        
    }
    
    private func getImageFromAsset(){
        self.image = UIImage(named: imageName)
        
        print("Set image to : \(image)")
        
    }
    
    func saveImageToFileManager(){
        
        guard
            let imageToSave = image else {
            print("Null image to save")
            return }
        
        LocalFileManager.instance.saveToFileManager(image: imageToSave, name: "image_01")
    }
    
    func saveImageToGallery(){
        guard
            let imageToSave = image else {
            print("Null image to save")
            return
            
        }
        
        LocalFileManager.instance.saveImageToGallery(image: imageToSave)
    }
    
    
}

struct SwiftUIFileManagerTest: View {
    
    @StateObject private var viewModel : SwiftUIFileManagerViewModel = SwiftUIFileManagerViewModel()
    
    
    var body: some View {
        VStack{
            if let image = viewModel.image {
                Image(uiImage : image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Image is null")
            }
            
            
            Text("Save To File Manager")
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.orange)
                    
                )
                .font(.headline)
                .onTapGesture {
                    viewModel.saveImageToGallery()
                    
                }
            
            Spacer()
            
        }
    }
}

struct SwiftUIFileManagerTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFileManagerTest()
    }
}
