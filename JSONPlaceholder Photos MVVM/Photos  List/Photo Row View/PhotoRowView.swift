//
import SDWebImageSwiftUI
import SwiftUI

struct PhotoRowView: View {
    
    let photo: PhotoModel
    
    var body: some View {
        VStack {
            WebImage(url: photo.url) { image in
                
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(8)
                
            } placeholder: {
                ProgressView()
            }
            
            Text(photo.title)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    PhotoRowView(photo: PhotoModel(albumId: 1, id: 1, title: "title", url: URL(string: "https://via.placeholder.com/600/771796")!, thumbnailUrl: URL(string: "https://via.placeholder.com/600/771796")!))
}
