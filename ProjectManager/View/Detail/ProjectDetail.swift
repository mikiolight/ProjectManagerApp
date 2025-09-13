//
//  ProjectDetail.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct ProjectDetail: View {
    var body: some View {
        VStack(alignment: .leading){
            DetailRow(rowHead: "Project", rowContent: "Project Name")
            DetailRow(rowHead: "Description", rowContent: "Description Content")
            
            Text("Note")
                .font(.footnote)
                .padding()
            List{
                // Todo: Replace NavigationLink
                // Todo: Grouping check
                DetailRow(rowHead: Date().formatted(), rowContent: "SomeTasks")
            }.listStyle(.grouped)
            
            Spacer()
        }.padding()
    }
}

#Preview {
    ProjectDetail()
}
