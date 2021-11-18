//
//  TaskView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import SwiftUI

struct TaskView: View {

    @State var tasks = [Task]()

    var body: some View {

        List {

            Button(action: addTask, label: {
                Text("Add Task")
            })

            ForEach(tasks) { task in
                Text(task.name)
            }
        }
    }
}

private extension TaskView {

    func addTask() {
        tasks.append(Task(name: "Wash the car"))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
