import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("InstagramLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureField("Enter your password", text: $password)
                        .modifier(IGTextFieldModifier())
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    Button(action: {}) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    HStack {
                        Rectangle().frame(height: 1)
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Rectangle().frame(height: 1)
                    }
                    .foregroundColor(.secondary)
                    
                    Image("ContinueWithFacebook")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)

                }
                .tint(.blue)
                .font(.subheadline)
                
                Spacer()
                Divider()
                NavigationLink {
                    AddEmailview()
                } label: {
                    HStack(spacing: 4.0) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
