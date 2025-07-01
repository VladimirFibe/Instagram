import SwiftUI

struct ProfileView: View {
    
    private let gridItem: [GridItem] = Array(repeating: .init(.flexible(), spacing: 1), count: 3)
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    HStack(spacing: 50){
                        Image("timothy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        HStack(spacing: 6) {
                            UserStatView(value: 3, title: "Posts")
                            UserStatView(value: 8, title: "Followes")
                            UserStatView(value: 34, title: "Following")
                        }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Chadwick Bozeman")
                            .fontWeight(.semibold)
                        Text("Wakanda Forever")
                        
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.secondary, lineWidth: 1)
                            )
                    }
                    
                    Divider()
                    
                }
                .padding()
                
                LazyVGrid(columns: gridItem, spacing: 1) {
                    ForEach(0..<15, id: \.self) { _ in
                        Image("timothy")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { }) {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
