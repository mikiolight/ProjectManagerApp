//
//  TaskList.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct TaskList: View {
    var body: some View {
        List{
            TaskRow()
            TaskRow()
        }
    }
}

#Preview {
    TaskList()
}
