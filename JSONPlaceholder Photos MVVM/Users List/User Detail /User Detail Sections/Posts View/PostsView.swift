//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var viewModel: UserDetailViewModel
    
    var body: some View {
        VStack {
            List(viewModel.posts) { post in
                NavigationLink {
                    CommentsListView(viewModel: CommentsListViewModel(postID: String(post.id), service: viewModel.services))
                } label: {
                    PostRowView(post: post)
                }

                
            }
        }
    }
}

#Preview {
    PostsView(viewModel: UserDetailViewModel(user: UserModel(id: 1, name: "Nerdy Yawdie", username: "Nerd", email: "nerdyyawdie@yoo.com", address: UserAddress(street: "1 Hundred Lane", suite: "Suite 876", city: "Kingston", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "Anyone can learn anything, with Time, Practice & Failures", bs: "")), services: APIServicesImpl()))
}
