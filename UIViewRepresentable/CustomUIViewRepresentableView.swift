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
            Text("Hello, world!")
            
            TextField("Placeholder", text: $text)
                .frame(height: 55)
                .background(Color.gray)
            
            UITextFieldViewRepresentable()
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
    
    func makeUIView(context: Context) -> some UIView {
        return getTextField()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: "Placeholder", attributes: [.foregroundColor: UIColor.red])
        textField.attributedPlaceholder = placeholder
        return textField
    }
}
