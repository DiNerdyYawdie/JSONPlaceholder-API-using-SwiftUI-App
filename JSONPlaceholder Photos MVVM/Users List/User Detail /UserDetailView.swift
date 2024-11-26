//

import SwiftUI

struct UserDetailView: View {
    
    @StateObject var viewModel: UserDetailViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(viewModel.user.username)
                    .padding(.leading)
                
                Text(viewModel.user.email)
                    .padding(.leading)
                
                Picker(LocalizedStringKey("Detail Screen Section"), selection: $viewModel.userDetailSections) {
                    
                    ForEach(UserDetailSections.allCases) { section in
                        Text(section.title)
                            .tag(section)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                switch viewModel.userDetailSections {
                case .posts:
                    if !viewModel.posts.isEmpty {
                        PostsView(viewModel: viewModel)
                    } else {
                        ContentUnavailableView(LocalizedStringKey("No Posts Available"), systemImage: "magnifyingglass", description: Text("No Posts found. Please recheck your internet connection & retry."))
                    }
                    
                case .about:
                    AboutFormView(viewModel: viewModel)
                case .todos:
                    TodoView(viewModel: TodoViewModel(userID: String(viewModel.user.id), service: viewModel.services))
                }
                
                
            }
            .navigationTitle(Text(viewModel.user.name))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.makePhoneCall()
                    } label: {
                        Image(systemName: "phone")
                    }

                }
            }
            .task {
                await viewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    UserDetailView(viewModel: UserDetailViewModel(user: UserModel(id: 1, name: "Nerdy Yawdie", username: "Nerd", email: "nerdyyawdie@yoo.com", address: UserAddress(street: "1 Hundred Lane", suite: "Suite 876", city: "Kingston", zipcode: "09003", geo: UserGeo(lat: "1112", lng: "1111")), phone: "112324556", website: "google.com", company: Company(name: "Youtube", catchPhrase: "Anyone can learn anything, with Time, Practice & Failures", bs: "")), services: APIServicesImpl()))
}
