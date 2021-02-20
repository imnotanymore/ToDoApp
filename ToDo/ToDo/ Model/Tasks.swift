//
//  Tasks.swift
//  ToDo
//
//  Created by Patryk Leszner on 20/02/2021.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG

let testDataTasks = [
    Task(title: "1", completed: true),
    Task(title: "2", completed: false),
    Task(title: "3", completed: false)
]

#endif








