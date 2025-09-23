import SwiftUI

struct ListTopTab: View {
	@State var selectedTab: TicketStatus = .notStarted
	let statusTabs = TicketStatus.allCases
	var tickets: [Ticket]

	var body: some View {
		let filteredTickets = tickets.filter {
			$0.status == selectedTab
		}
		VStack{
			Picker("tab", selection: $selectedTab){
				ForEach(statusTabs, id: \.self){ tab in
					Text(tab.rawValue)
				}
			}
			.pickerStyle(SegmentedPickerStyle())
			.padding()

			if filteredTickets.isEmpty{
				Text("No tickets for this tab")
				Spacer()
			}else{
				TicketList(tickets: filteredTickets)
			}
		}
	}
}

#Preview {
	ListTopTab(tickets: SampleData.getProjectWithTickets().tickets)
}
