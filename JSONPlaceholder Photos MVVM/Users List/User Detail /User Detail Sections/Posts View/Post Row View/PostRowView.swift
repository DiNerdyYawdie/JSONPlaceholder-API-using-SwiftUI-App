//

import SwiftUI

struct PostRowView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 5)
            
            Text(post.body)
        }
    }
}

#Preview {
    PostRowView(post: Post(userId: 1, id: 1, title: "Wa Gwan", body: "Hey im here just being some text"))
}
