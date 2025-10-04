import SwiftUI
import SwiftData

struct NoteForm: View {
	@Environment(\.modelContext) var modelContext: ModelContext
	@Environment(\.dismiss) var dismiss

	@Binding var isPresented: Bool
	var parentTicket: Ticket
	@State var noteDetail: String = ""
	@State var inputurl: String = ""

	let dateTimeNow: Date = Date()

	var body: some View {
		NavigationStack{
			FormRow(
				contentTitle: "Note",
				placeholder: "Note Content",
				value: $noteDetail
			)

			FormRow(
				contentTitle: "URL",
				placeholder: "Reference URL",
				value: $inputurl
			)
			.navigationTitle("Note Form")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItem(placement: .bottomBar) {
					Button("Cancel") {
						dismiss()
					}
				}
				ToolbarItem(placement: .bottomBar) {
					Button("Save") {
						saveNote()
					}
					.disabled(noteDetail.isEmpty)
				}
			}
			Spacer()
		}
	}

	private func saveNote(){
		let newNote = Note(
			ticket: parentTicket,
			note: noteDetail,
			url: URL(string: inputurl),
			madeDateTime: dateTimeNow
		)
		modelContext.insert(newNote)
		dismiss()
	}
}

#Preview {
	NoteForm(isPresented: .constant(true), parentTicket: SampleData.ticket1)
}
