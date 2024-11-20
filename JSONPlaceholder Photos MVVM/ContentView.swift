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
        }
        
    }
}

#Preview {
    ContentView()
}
