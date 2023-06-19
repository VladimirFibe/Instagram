import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = EditProfileViewModel()
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .fontWeight(.regular)
                Spacer()
                Text("Edit Profile")
                Spacer()
                Button("Done") {
                    Task {
                        try await viewModel.updatePersonData()
                        dismiss()
                    }
                }
                .fontWeight(.bold)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            Divider()
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                        if let image = viewModel.profileImage {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            CircularImageView(url: viewModel.person?.avatar)
                        }
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                    
            }
            EditProfileRow(title: "Name", placeholder: "Enter your name", text: $viewModel.name)
            EditProfileRow(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            Spacer()
        }
        .padding()
    }
}

struct EditProfileRow: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
#Preview {
    EditProfileView()
}
