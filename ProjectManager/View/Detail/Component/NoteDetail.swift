import SwiftUI

struct NoteDetail: View {
    let ticketName: String
    let note: String
    
    var body: some View {
        VStack{
            HStack(){
                Image(systemName: "note.text")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                
                VStack(alignment: .leading){
                    Text(Date().formatted())
                    Text(ticketName)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
           
            Text(note)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            // Todo: Add Link for edit and delete
        }
    }
}

#Preview {
    NoteDetail(ticketName: "TaskName", note: "some note")
}
