import SwiftUI

struct NoteDetail: View {
    let ticketName: String
    let note: Note

    var body: some View {
        VStack{
            HStack(){
                Image(systemName: "note.text")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                
                VStack(alignment: .leading){
					Text(note.madeDateTime.shortDateTime())
                    Text(ticketName)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
           
			Text(note.note)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            // Todo: Add Link for edit and delete
        }
    }
}

#Preview {
	do{
		SampleData.setupRelations()
	}
	return NoteDetail(
		ticketName: SampleData.ticket1.ticketName,
		note: SampleData.ticket1.notes.first!
	)
}
