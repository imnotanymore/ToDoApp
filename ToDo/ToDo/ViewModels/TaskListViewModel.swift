//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Patryk Leszner on 20/02/2021.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject{
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        self.taskCellViewModels = DataTasks.map(){ task in
            TaskCellViewModel(task: task)
            
        }
    }
    
    func addTask(task: Task){
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
    
    
}

