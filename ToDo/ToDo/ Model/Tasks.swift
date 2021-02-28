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



let DataTasks = [
    Task(title: "", completed: false),
]










