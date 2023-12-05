//
//  UIViewControllerRepresentableTextView.swift
//  UIViewControllerRepresentableTextView
//
//  Created by Samet Çağrı Aktepe on 4.12.2023.
//

import SwiftUI

struct UIViewControllerRepresentableTextView: View {
    
    @State private var showScreen: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            Button("Click me") {
                showScreen.toggle()
            }
            .sheet(isPresented: $showScreen, content: {
                BasicUIViewControllerRepresentable(labelText: "Hello, world!")
            })
        }
    }
}

// uiviewcontrollerrepesentable
struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        vc.view.addSubview(label)
        label.frame = vc.view.frame
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


#Preview {
    UIViewControllerRepresentableTextView()
}

