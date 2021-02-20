//
//  TaksCellViewModel.swift
//  ToDo
//
//  Created by Patryk Leszner on 20/02/2021.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable{
   @Published var task: Task
    
    var id = ""
    @Published var completionIcon = ""
    
    private var canncellables = Set<AnyCancellable>()
    
    init(task: Task){
        self.task = task
        
        $task
            .map {task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionIcon, on: self)
            .store(in: &canncellables)
        
        $task
            .map { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &canncellables)
    }
}
