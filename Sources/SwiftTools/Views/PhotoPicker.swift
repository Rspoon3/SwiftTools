//
//  PhotoPicker.swift
//  
//
//  Created by Richard Witherspoon on 4/16/21.
//

import SwiftUI
import PhotosUI

@available(iOS 14.0, *)
public struct PhotoPicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode

    public let configuration: PHPickerConfiguration
    let handler: ([PHPickerResult]) -> Void
    
    public init(configuration: PHPickerConfiguration, handler: @escaping ([PHPickerResult]) -> Void){
        self.configuration = configuration
        self.handler = handler
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
    }
    
    public func makeCoordinator() -> PhotoPicker.Coordinator {
        return Coordinator(self)
    }
    
    public class Coordinator: NSObject, PHPickerViewControllerDelegate{
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.handler(results)
            parent.presentationMode.wrappedValue.dismiss()
        }  
    }
}
