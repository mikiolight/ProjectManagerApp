import SwiftUI

struct ListBottomTab: View {
	var tickets: [Ticket]

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
	ListBottomTab(tickets: SampleData.getProjectWithTickets().tickets)
}
