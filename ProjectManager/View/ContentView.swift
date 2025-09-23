import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) private var modelContext

	@Query private var projects: [Project]
	@Query private var tickets: [Ticket]
	@Query private var notes:[Note]

	var body: some View {
		ListBottomTab(tickets: tickets)
	}
}

#Preview {
	ContentView()
}
