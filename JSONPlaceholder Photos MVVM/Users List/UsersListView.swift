//

import SwiftUI

struct UsersListView: View {
    
    @StateObject var viewModel = UsersListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if !viewModel.users.isEmpty {
                    List(viewModel.users) { user in
                        NavigationLink {
                            UserDetailView(viewModel: UserDetailViewModel(user: user, services: viewModel.services))
                        } label: {
                            UserRowView(user: user)
                        }

                    }
                } else {
                    ContentUnavailableView("No Users Available", systemImage: "person", description: Text("Unable to fetch Users. Please recheck your internet connection"))
                }
                
            }
            .navigationTitle(Text("Users"))
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching All users..."))
                }
            }
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .task {
                await viewModel.fetchUsers()
            }
            .refreshable {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UsersListView()
}
