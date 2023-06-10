import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Welcome to Instagramm")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Button {
                
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
}

#Preview {
    CompleteSignUpView()
}
