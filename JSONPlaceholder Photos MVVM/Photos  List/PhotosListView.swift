//

import SwiftUI

struct PhotosListView: View {
    
    @StateObject var viewModel: PhotosListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.photos.isEmpty {
                    List(viewModel.photos) { photo in
                        PhotoRowView(photo: photo)
                    }

                } else {
                    ContentUnavailableView("No Photos", systemImage: "photo.badge.arrow.down", description: Text("Refresh page or recheck your internet connection."))
                }
            }
            .navigationTitle(Text("Photos App"))
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.showErrorAlert, content: {
                Alert(title: Text(viewModel.errorMessage))
            })
            .task {
                await viewModel.fetchPhotos()
            }
            .refreshable {
                await viewModel.fetchPhotos()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView {
                        VStack {
                            Text("Fetching Photos...")
                                .bold()
                        }
                        .padding()
                        .background(Color.white.border(.gray))
                        .cornerRadius(4)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosListView(viewModel: PhotosListViewModel())
}

