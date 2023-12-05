//
//  UIViewControllerRepresentableTextView.swift
//  UIViewControllerRepresentableTextView
//
//  Created by Samet Çağrı Aktepe on 4.12.2023.
//

import SwiftUI

struct UIViewControllerRepresentableTextView: View {
    
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            Button("Click me") {
                showScreen.toggle()
            }
            .sheet(isPresented: $showScreen, content: {
                UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
            })
        }
    }
}

// uiviewcontrollerrepesentable
struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    // data from SwiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    // data from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = (info[.originalImage] as? UIImage) else { return }
            image = newImage
            showScreen.toggle()
        }
    }
}

class MyFirstViewController: UIViewController {
    
    var labelText: String = "Starting value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}




#Preview {
    UIViewControllerRepresentableTextView()
}

