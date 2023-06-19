import SwiftUI

struct CreateUserNameView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            TextField("Username", text: $viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }
            Spacer()
        }
        .tint(.blue)
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

