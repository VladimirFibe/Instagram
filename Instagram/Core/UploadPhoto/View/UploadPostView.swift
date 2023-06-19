import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var text = ""
    @State private var imagePickerPresented = false
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var selection: MainTabs
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    text = ""
                    viewModel.profileImage = nil
                    viewModel.selectedImage = nil
                    selection = .feed
                }) {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    Task {
                        try await viewModel.uploadPost(caption: text)
                        viewModel.profileImage = nil
                        viewModel.selectedImage = nil
                        text = ""
                        selection = .feed
                    }
                }) {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            HStack(alignment: .top, spacing: 8) {
                    if let image = viewModel.profileImage {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                imagePickerPresented.toggle()
                            }
                    }
                TextField("Enter your caption", text: $text, axis: .vertical)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented,
                      selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(selection: .constant(.feed))
}
