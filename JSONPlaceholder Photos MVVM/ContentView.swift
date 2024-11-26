//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PhotosListView(viewModel: PhotosListViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "photo")
                        
                        Text("Photos")
                    }
                }
            
            UsersListView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        
                        Text("Users")
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
