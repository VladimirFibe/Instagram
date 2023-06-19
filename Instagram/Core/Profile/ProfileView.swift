import SwiftUI
import FirebaseAuth
struct ProfileView: View {
    let person: Person
    @State private var showEditProfile = false
    private let gridItmes: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var buttonTitle: String {
        person.isCurrentPerson ? "Edit Profile" : "Follow"
    }
    var body: some View {
            ScrollView {
                header
                posters
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
                AsyncCircleImage(url: person.avatar, width: 80)
                
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
    var posters: some View {
        LazyVGrid(columns: gridItmes, spacing: 1) {
            ForEach(0 ..< 15, id: \.self) { item in
                AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}
