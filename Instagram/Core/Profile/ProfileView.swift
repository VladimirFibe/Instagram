import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    let person: Person
    @State private var showEditProfile = false
    
    var buttonTitle: String {
        person.isCurrentPerson ? "Edit Profile" : "Follow"
    }
    var body: some View {
            ScrollView {
                header
                PostGridView(person: person)
            }
            .padding(.horizontal)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                        try Auth.auth().signOut()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
    }
    
    var header: some View {
        VStack(spacing: 10.0) {
            HStack {
                CircularImageView(url: person.avatar)
                
                HStack {
                    UserStatView(value: 3, title: "Post")
                    UserStatView(value: 3, title: "Followers")
                    UserStatView(value: 3, title: "Following")
                }
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(person.username)
                    .fontWeight(.semibold)
                
                Text(person.bio)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                if person.isCurrentPerson {
                    showEditProfile.toggle()
                } else {
                    print("follow")
                }
            }) {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView()
        }
        
    }
}
