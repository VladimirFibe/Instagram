import SwiftUI
import FirebaseFirestoreSwift

struct SearchView: View {
    @FirestoreQuery(collectionPath: "persons") var persons: [Person]
    @State private var text = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(persons) { person in
                        NavigationLink(value: person) {
                            SearchRow(person: person)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $text, prompt: "Search...")
            }
            .navigationDestination(for: Person.self, destination: { person in
                ProfileView(person: person)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchRow: View {
    let person: Person
    var body: some View {
        HStack {
            AsyncCircleImage(url: person.avatar, width: 40)
            VStack(alignment: .leading) {
                Text(person.username).fontWeight(.semibold)
                Text(person.email)
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
