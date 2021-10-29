//
//  SearchBar.swift
//  
//
//  Created by Richard Witherspoon on 4/22/21.
//

import SwiftUI

public struct SearchBar: UIViewRepresentable{
    @Binding var text: String
    let placeholder: String?
    let searchTextFieldFont: UIFont?
    let backgroundColor: UIColor
    let showXButton: Bool
    let showCancelButton: Bool
    let didBeginEditing: (()->Void)?
    let didEndEditing: (()->Void)?
    let searchBarCancelButtonClicked: (()->Void)?
    
    
    public init(text: Binding<String>,
                placeholder: String? = nil,
                searchTextFieldFont: UIFont? = nil,
                backgroundColor: UIColor = .secondarySystemGroupedBackground,
                showXButton: Bool = true,
                showCancelButton: Bool = false,
                didBeginEditing: (()->Void)? = nil,
                didEndEditing: (()->Void)? = nil,
                searchBarCancelButtonClicked: (()->Void)? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.searchTextFieldFont = searchTextFieldFont
        self.backgroundColor = backgroundColor
        self.showXButton = showXButton
        self.showCancelButton = showCancelButton
        self.didBeginEditing = didBeginEditing
        self.didEndEditing = didEndEditing
        self.searchBarCancelButtonClicked = searchBarCancelButtonClicked
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchTextField.backgroundColor = backgroundColor
        
        if let placeholder = placeholder{
            searchBar.placeholder = placeholder
        }
        
        searchBar.backgroundImage = UIImage()
        
        if !showXButton{
            searchBar.setImage(UIImage(), for: .clear, state: .normal)
        }
        
        if let font = searchTextFieldFont{
            searchBar.searchTextField.font = font
        }

        return searchBar
    }
    
    public func updateUIView(_ searchBar: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        searchBar.text = text
        
        if let placeholder = placeholder{
            searchBar.placeholder = placeholder
        }
    }
    
    
    public class Coordinator: NSObject, UISearchBarDelegate{
        var parent: SearchBar
        
        init(_ uiSearchBar: SearchBar) {
            self.parent = uiSearchBar
        }
        
        public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.parent.didBeginEditing?()
            
            if parent.showCancelButton{
                searchBar.setShowsCancelButton(true, animated: true)
            }
        }
        
        public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            self.parent.didEndEditing?()
            
            if parent.showCancelButton{
                DispatchQueue.main.async {
                    if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton{
                        cancelButton.isEnabled = true
                    }
                }
            }
        }
        
        public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.text = searchText
            
            if searchText.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    searchBar.resignFirstResponder()
                    
                    if self.parent.showCancelButton{
                        searchBar.setShowsCancelButton(false, animated: true)
                        self.parent.searchBarCancelButtonClicked?()
                    }
                }
            }
        }
        
        public func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
            searchBar.resignFirstResponder()
        }
        
        public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.setShowsCancelButton(false, animated: true)
            self.parent.text.removeAll()
            self.parent.searchBarCancelButtonClicked?()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    struct Container: View{
        @State private var textOne = String()
        
        var body: some View{
            VStack{
                SearchBar(text: $textOne, placeholder: "Search")
            }
        }
    }
    
    static var previews: some View {
        Container()
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName(".sizeThatFits")
    }
}
