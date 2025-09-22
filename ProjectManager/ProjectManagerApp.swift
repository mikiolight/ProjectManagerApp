import SwiftUI
import SwiftData

@main
struct ProjectManagerApp: App {
	let modelContainer: ModelContainer

	init() {
		let schema = Schema([
			Project.self,
			Ticket.self,
			Note.self,
		])
		self.modelContainer = try! ModelContainer(for: schema)
	}

	var body: some Scene {
		WindowGroup {
			ContentView()
				.modelContainer(modelContainer)
		}
	}
}
