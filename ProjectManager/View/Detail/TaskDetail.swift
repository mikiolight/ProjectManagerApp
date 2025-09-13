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
            
            // Todo: Add Split to Change Task Button
            if(true){
                HStack{
                    BackIcon()
                    ForwardIcon()
                    CompleteIcon()
                }
            }else if(true){
                HStack{
                    
                }
            }else if(true){
                Button(action:{}){
                    Image(systemName: "")
                }
            }
            
            // Todo: Add relation to Data
            DetailRow(rowHead: "Task", rowContent: "Task Name")
            DetailRow(rowHead: "Project", rowContent: "Project Name")
            DetailRow(rowHead: "Started", rowContent: Date().formatted())
            DetailRow(rowHead: "Due", rowContent: Date().formatted())
            
            Text("Note")
                .font(.footnote)
                .padding()
            List{
                NoteDetail(taskName: "Task Name", note: "Some Note\nWe can add multiple lines")
            }.listStyle(.plain)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


#Preview {
    TaskDetail()
}
