import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            SecureField("Password", text: $viewModel.password)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CompleteSignUpView()
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

