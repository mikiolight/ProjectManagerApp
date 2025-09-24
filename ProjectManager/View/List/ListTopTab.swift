import SwiftUI

struct ListTopTab: View {
	@State var selectedTab: TicketStatus = .notStarted
	var tickets: [Ticket]

	private var filteredTickets: [Ticket] {
		tickets.filter{ $0.status == selectedTab}
	}

	var body: some View {
		let filteredTickets = tickets.filter {
			$0.status == selectedTab
		}
		VStack{
			Picker("tab", selection: $selectedTab){
				ForEach(TicketStatus.allCases, id: \.self){ tab in
					Text(tab.rawValue)
				}
			}
			.pickerStyle(SegmentedPickerStyle())
			.padding()

			if filteredTickets.isEmpty{
				ContentUnavailableView(
					"No tickets for this tab",
					systemImage: "ticket",
					description: Text("There is no ticket with this status.")
				)
			}else{
				TicketList(tickets: filteredTickets)
			}
		}
	}
}

#Preview {
	ListTopTab(tickets: SampleData.getProjectWithTickets().tickets)
}
