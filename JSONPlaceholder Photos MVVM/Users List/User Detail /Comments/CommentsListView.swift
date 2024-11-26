//

import SwiftUI

struct CommentsListView: View {
    
    @StateObject var viewModel: CommentsListViewModel
    
    var body: some View {
        VStack {
            List(viewModel.comments) { comment in
                CommentRowView(comment: comment)
            }
            .listStyle(.plain)
        }
        .navigationTitle(Text("Comments"))
        .task {
            await viewModel.fetchComments()
        }
        .alert(isPresented: $viewModel.showErrorAlert, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
        .overlay {
            if viewModel.isLoading {
                ProgressView {
                    VStack {
                        Text("Fetching Comments...")
                            .font(.title2)
                            .bold()
                            .padding(5)
                    }
                    .background(Color.gray)
                    .cornerRadius(4)
                    
                }
            }
        }
        
    }
}

#Preview {
    CommentsListView(viewModel: CommentsListViewModel(postID: "1", service: APIServicesImpl()))
}
