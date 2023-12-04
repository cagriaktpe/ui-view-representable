//
//  CustomUIViewRepresentableView.swift
//  UIViewRepresentable
//
//  Created by Samet Çağrı Aktepe on 4.12.2023.
//

import SwiftUI

struct CustomUIViewRepresentableView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            
            TextField("Placeholder", text: $text)
                .frame(height: 55)
                .background(Color.gray)
            
            UITextFieldViewRepresentable(text: $text)
                .frame(height: 55)
                .background(Color.gray)
        }
    }
}

#Preview {
    CustomUIViewRepresentableView()
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view
    }
    
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    // data from swiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    // data from UIKit to swiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: "Placeholder", attributes: [.foregroundColor: UIColor.red])
        textField.attributedPlaceholder = placeholder
        return textField
    }
}
