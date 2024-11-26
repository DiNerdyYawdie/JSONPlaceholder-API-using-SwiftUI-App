//
import UIKit
import Foundation

class UserDetailViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var userDetailSections: UserDetailSections = .posts
    
    let user: UserModel
    let services: APIServices
    
    init(user: UserModel, services: APIServices) {
        self.user = user
        self.services = services
    }
    
    @MainActor
    func fetchPosts() async {
        do {
            posts = try await services.fetchPostsByUserID(endpoint: .postsByUser(String(user.id)))
            
        } catch {
            // TODO: You should handle your errors
            // Use previous streams to help
            print(error)
        }
    }
    
    func makePhoneCall() {
        guard let phoneNumberURL = URL(string: "tel://" + user.phone) else { return }
        
        // Need to run on Real device to test calling
        if UIApplication.shared.canOpenURL(phoneNumberURL) {
            UIApplication.shared.open(phoneNumberURL)
        }
    }
}
