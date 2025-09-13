//
//  NoteDetail.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct NoteDetail: View {
    let taskName: String
    let note: String
    
    var body: some View {
        VStack{
            HStack(){
                Image(systemName: "note.text")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                
                VStack(alignment: .leading){
                    Text(Date().formatted())
                    Text(taskName)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
           
            Text(note)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            // Todo: Add Link for edit and delete
        }
    }
}

#Preview {
    NoteDetail(taskName: "TaskName", note: "some note")
}
