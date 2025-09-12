//
//  ListButtomTab.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/13.
//

import SwiftUI

struct ListButtomTab: View {
    var body: some View {
        TabView{
            ListTopTab()
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add Project")
                }
            ListTopTab()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

#Preview {
    ListButtomTab()
}
