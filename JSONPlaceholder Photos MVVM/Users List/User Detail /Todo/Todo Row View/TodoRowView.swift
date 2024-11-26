//

import SwiftUI

struct TodoRowView: View {
    
    let todo: Todo
    let buttonTapped: (String) -> Void
    
    var body: some View {
        HStack {
            Text(todo.title)
            
            Spacer()
            
            Button {
                buttonTapped(String(todo.id))
            } label: {
                Image(systemName: todo.completed ? "circle.fill" :"circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }

        }
    }
}

#Preview {
    TodoRowView(todo: Todo(userId: 1, id: 1, title: "Bathe", completed: true)) { _ in
        
    }
}
