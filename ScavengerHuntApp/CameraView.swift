//
//  CameraView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-13.
//

import SwiftUI
import UIKit
import Photos

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var onImageCaptured: ((UIImage) -> Void)?

    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                Task { @MainActor in
                    self.parent.image = uiImage
                    self.parent.onImageCaptured?(uiImage)
                    self.saveImageToPhotoLibrary(uiImage)
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }

        /// **Save Image to Photo Library**
        private func saveImageToPhotoLibrary(_ image: UIImage) {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized || status == .limited {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                } else {
                    print("Photo Library access denied.")
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    @MainActor
    func makeUIViewController(context: Context) -> UIImagePickerController {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera not available on this device.")
            return UIImagePickerController()
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    static var supportsCamera: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
}
#Preview {
//    CameraView()
}
