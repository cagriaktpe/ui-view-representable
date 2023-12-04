//
//  CustomUIViewRepresentableView.swift
//  UIViewRepresentable
//
//  Created by Samet Çağrı Aktepe on 4.12.2023.
//

import SwiftUI

struct CustomUIViewRepresentableView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            BasicUIViewRepresentable()
             
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
