//
//  ShareSheetView.swift
//  
//
//  Created by Richard Witherspoon on 1/24/20.
//

import SwiftUI


public struct ShareSheetView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    private let items: [Any]
    
    public init(items: [Any]){
        self.items = items
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheetView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            self.presentationMode.wrappedValue.dismiss()
        }
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheetView>) {
    }
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView(items: [])
    }
}
