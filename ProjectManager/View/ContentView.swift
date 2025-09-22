import SwiftUI
import SwiftData

struct ContentView: View {
	// @State private var viewModel =

	@Environment(\.modelContext) private var modelContext

	@Query private var projects: [Project]
	@Query private var tickets: [Ticket]
	@Query private var notes:[Note]

	var body: some View {
		ListBottomTab()
	}
}


#Preview {
	ContentView()
}
