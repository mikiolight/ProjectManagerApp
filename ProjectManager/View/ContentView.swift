//
//  ContentView.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	// @State private var viewModel =

	@Environment(\.modelContext) private var modelContext

	@Query private var projects: [Project]
	@Query private var tickets: [Ticket]
	@Query private var notes:[Note]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
	ContentView()
}
