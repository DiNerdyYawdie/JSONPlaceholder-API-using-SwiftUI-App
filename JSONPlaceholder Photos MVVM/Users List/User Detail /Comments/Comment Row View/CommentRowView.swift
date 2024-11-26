//

import SwiftUI

struct CommentRowView: View {
    
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(comment.name.capitalized)
                .font(.headline)
            
            Text(comment.email)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(comment.body)
                .padding(.bottom, 5)
        }
    }
}

#Preview {
    CommentRowView(comment: Comment(id: 1, postId: 1, name: "Nerdy", email: "Nerdyy@yawdie.com", body: "Wa Gwan mi deh ya g"))
}
