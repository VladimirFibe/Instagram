import Firebase

struct PostService {
    private static let postsCollection = Firestore.firestore().collection("posts")
    static func fetchAllPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        for index in posts.indices {
            let uid = posts[index].ownerUid
            posts[index].person = try await UserService.fetchPerson(with: uid)
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String?) async throws -> [Post] {
        guard let uid else { return []}
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    }
}
