//
//  ContentView.swift
//  ToDo
//
//  Created by Patryk Leszner on 20/02/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var TaskListVM = TaskListViewModel()
    let tasks = testDataTasks

    @State var presentAddNewItem = false
    
    var body: some View {
     
        NavigationView {
            VStack(alignment: .leading) {
                List{
                ForEach(TaskListVM.taskCellViewModels) { taskCellVM in
                    TaskCell(taskCellVM: taskCellVM)
                }
                    if presentAddNewItem{
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.TaskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                HStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Add New ToDo")
                }
            }
            .padding()
        }
        .navigationBarTitle("To Do")
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = { _ in}
    var body: some View {
        HStack{
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture{
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("What You need ToDo?", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}
