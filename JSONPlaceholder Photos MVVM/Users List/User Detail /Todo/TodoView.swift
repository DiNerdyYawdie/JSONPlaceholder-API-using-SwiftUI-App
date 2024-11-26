//

import SwiftUI

struct TodoView: View {
    
    @StateObject var viewModel: TodoViewModel
    
    var body: some View {
        VStack {
            
            if !viewModel.todos.isEmpty {
                List(viewModel.todos) { todo in
                    TodoRowView(todo: todo) { selectedTodoID in
                        viewModel.handleTodoUpdate(todoID: selectedTodoID)
                    }
                }
            } else {
                ContentUnavailableView("No Todos Added", systemImage: "book", description: Text("Add some Todos to build up your list."))
            }
            
        }
        .task {
            await viewModel.fetchTodos()
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text(viewModel.errorMessage))
        }
    }
}

#Preview {
    TodoView(viewModel: TodoViewModel(userID: "1", service: APIServicesImpl()))
}
