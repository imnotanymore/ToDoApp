//
//  ContentView.swift
//  ToDo
//
//  Created by Patryk Leszner on 20/02/2021.
//

import SwiftUI

struct ContentView: View {
    let tasks = testDataTasks

    
    var body: some View {
        NavigationView {
        VStack(alignment: .leading) {
            List(tasks) { task in
                TaskCell(task: task)
            }
            Button(action: {}) {
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
    let task: Task
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
            Text(task.title)
        }
    }
}
