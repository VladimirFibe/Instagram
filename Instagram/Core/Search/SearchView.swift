import SwiftUI

struct SearchView: View {
    @State private var text = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0 ..< 5) { item in
                        HStack {
                            AsyncCircleImage(url: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80", width: 40)
                            VStack(alignment: .leading) {
                                Text("batman").fontWeight(.semibold)
                                Text("Bruce Wayne")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $text, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
