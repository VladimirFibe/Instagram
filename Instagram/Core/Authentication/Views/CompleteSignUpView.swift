import SwiftUI

struct CompleteSignUpView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Button {
                createUser()
            } label: {
                Text("Complete Sign Up")
            }
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
    func createUser() {
        Task {
            try await viewModel.createUserWithEmailPassword()
        }
    }
}

