import SwiftUI

struct AddEmailview: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            TextField("", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUserNameView()
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

