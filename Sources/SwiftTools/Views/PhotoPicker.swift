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
    public let configuration: PHPickerConfiguration
    @Binding public var results: [PHPickerResult]
    
    public init(configuration: PHPickerConfiguration, results: Binding<[PHPickerResult]>){
        self.configuration = configuration
        self._results = results
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
            picker.dismiss(animated: true)
            parent.results = results
        }
    }
}
