import SwiftUI
import SwiftData

struct BottomTab: View {
	@Query var tickets: [Ticket]

	var body: some View {
		TabView{
			TicketForm()
				.tabItem{
					Image(systemName: "plus")
					Text("Add Project")
				}
			ListTopTab(tickets: tickets)
				.tabItem{
					Image(systemName: "list.bullet")
					Text("List")
				}
		}
	}
}

#Preview {
	// Preview用のContainer設定
	let container: ModelContainer={
		let configuration = ModelConfiguration(isStoredInMemoryOnly:true)
		do{
			// コンテナの作成
			let container = try ModelContainer(for: Project.self, Ticket.self, Note.self, configurations: configuration)

			// サンプル挿入
			for project in SampleData.projects {
				container.mainContext.insert(project)
			}

			return container
		}catch{
			fatalError("Failed to create container for preview: \(error.localizedDescription)")
		}
	}()

	BottomTab()
		.modelContainer(container)
}
