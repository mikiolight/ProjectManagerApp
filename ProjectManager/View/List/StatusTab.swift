import SwiftUI
import SwiftData

struct StatusTab: View {
	@State private var selectedTab: TicketStatus = .notStarted

	@Query(sort: \Ticket.startDate) private var allTickets: [Ticket]

	private var notStartedTickets: [Ticket] {
		allTickets.filter { $0.status == .notStarted }
	}

	private var inProgressTickets: [Ticket] {
		allTickets.filter { $0.status == .inProgress }
	}

	private var completeTickets: [Ticket] {
		allTickets.filter { $0.status == .complete }
	}

	var body: some View {
		NavigationStack{
			TabView(selection: $selectedTab){
				TicketList(tickets: notStartedTickets)
					.tabItem{
						BackButtonIcon()
					}.tag(TicketStatus.notStarted)
				TicketList(tickets: inProgressTickets)
					.tabItem{
						ForwardButtonIcon()
					}.tag(TicketStatus.inProgress)
				TicketList(tickets: completeTickets)
					.tabItem{
						CompleteButtonIcon()
					}.tag(TicketStatus.complete)
			}
			.navigationTitle(Text("Ticket List"))
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItem(placement: .navigationBarTrailing){
					NavigationLink(destination: TicketForm()){
						Image(systemName: "plus")
					}
				}
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

	StatusTab()
		.modelContainer(container)
}
