//
//  TaskDetail.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct TaskDetail: View {
    var body: some View {
        VStack(alignment: .leading){
            
            // Todo: Add button to Change Task
             
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct DetailRow: View{
    let rowHead: String
    let rowContent: String
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(rowHead)
                    .font(.footnote)
                Text(rowContent)
                    .font(.headline)
            }
            .padding()
        }
    }
}

#Preview {
    TaskDetail()
}
