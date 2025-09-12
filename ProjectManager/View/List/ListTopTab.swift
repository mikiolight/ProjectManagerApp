//
//  ListTopTab.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct ListTopTab: View {
    @State var selectedTab: String = "Not Started"
    let tabs = ["Not Started", "In Progress", "Complete"]
    
    var body: some View {
        VStack{
            Picker("tab", selection: $selectedTab){
                ForEach(tabs, id: \.self){ tab in
                    Text(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // ToDo: Add Status Filter for TaskList Showed
            TaskList()
        }
    }
}

#Preview {
    ListTopTab()
}
