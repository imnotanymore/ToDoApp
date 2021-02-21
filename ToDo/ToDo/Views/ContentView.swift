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
    @State private var editMode = EditMode.inactive
    var body: some View {
            VStack {
                NavigationView {
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .edgesIgnoringSafeArea(.all)
                        VStack(alignment: .leading){
                            List{
                                ForEach(TaskListVM.taskCellViewModels) { taskCellVM in
                                    TaskCell(taskCellVM: taskCellVM)
                                }
                                .onDelete(perform: onDelete)
                                .onMove(perform: onMove)
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
                                        .foregroundColor(.white)
                                    Text("Add New ToDo") .foregroundColor(Color.white)
                                }
                            }
                            .padding()
                        }
                        .navigationBarTitle(Text("To Do"))
                        .foregroundColor(.purple)
                        .navigationBarItems(leading: EditButton())
                        .foregroundColor(.purple)
                        .environment(\.editMode, $editMode)
                    }
                }
            }
        }
        private func onDelete(offsets: IndexSet) {
            TaskListVM.taskCellViewModels.remove(atOffsets: offsets)
            }
        private func onMove(source: IndexSet, destination: Int) {
            TaskListVM.taskCellViewModels.move(fromOffsets: source, toOffset: destination)
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
