//
//  ImagePicker.swift
//  CameraApp
//
//  Created by Toni Tani on 9.2.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isVisibile:Bool
    @Binding var image:Image?
    var sourceType:Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisibile: $isVisibile, image: $image)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.sourceType = sourceType == 1 ? .photoLibrary : .camera
        
        vc.delegate = context.coordinator
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var isVisibile:Bool
        @Binding var image:Image?
        
        init(isVisibile: Binding<Bool>, image: Binding<Image?>) {
            _isVisibile = isVisibile
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiimage)
            isVisibile = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisibile = false
        }
    }
}

