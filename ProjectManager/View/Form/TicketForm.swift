import SwiftUI
import SwiftData
import UIKit

struct TicketForm: View {
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss

	@State private var isModalShown: Bool = false
	@State private var selectedItem: Project? = nil
	@State private var newTicketName: String = ""
	@State private var newTicketDetail: String = ""
	@State private var newStartDate: Date? = Date()
	@State private var newDueDate: Date?
	@State private var newStatus: TicketStatus = .notStarted

	private var isFormValid: Bool {
		!newTicketName.isEmpty && selectedItem != nil
	}

	var body: some View {
		VStack(alignment: .leading)
		{
			Text("Project")
			ProjectPickerField(selected: $selectedItem)
			{
				isModalShown = true
			}
		}
		.padding()
		.sheet(isPresented: $isModalShown)
		{
			ModalWindow(
				isPresented: $isModalShown,
				selectedItem: $selectedItem
			)
		}

		FormRow(contentTitle: "Ticket*", placeholder: "Ticket Name", value: $newTicketName)
		FormRow(contentTitle: "Description", placeholder: "Ticket Detail", value: $newTicketDetail)
		FormDateRow(contentTitle: "Started", value: $newStartDate)
		FormDateRow(contentTitle: "Due", value: $newDueDate)

		HStack{
			VStack(alignment: .leading){
				Text("Status*")
				Picker("Status*", selection: $newStatus){
					Text("Not Started").tag(TicketStatus.notStarted)
					Text("In Progress").tag(TicketStatus.inProgress)
					Text("Completed").tag(TicketStatus.complete)
				}
			}

			Spacer()
		}
		.padding()
		.navigationTitle(Text("New Ticket"))
		.navigationBarTitleDisplayMode(.inline)
		.toolbar{
			ToolbarItem(placement: .bottomBar)
			{
				HStack{
					Button("Cancel"){
						dismiss()
					}

					Spacer()

					Button("Save"){
						saveTicket()
					}
				}
			}
		}
		.padding()
//#if canImport(UIKit)
		.toolbar{
			ToolbarItem(placement: .keyboard){
				Spacer()
				Button("Done"){
					hideKeyboard()
				}
			}
		}
//#endif
	}

	private func saveTicket(){
		guard let project = selectedItem else {return}
		let newTicket = Ticket(
			project: project,
			ticketName: newTicketName,
			ticketDetail: newTicketDetail,
			startDate: newStartDate,
			dueDate: newDueDate,
			completeDate: nil,
			status: newStatus
		)
		modelContext.insert(newTicket)
		project.tickets.append(newTicket)
		dismiss()
	}
}

//#if canImport(UIKit)
extension View{
	func hideKeyboard() {
		UIApplication.shared
			.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
//#endif

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

	TicketForm()
		.modelContainer(container)
}
