import SwiftUI

struct TaskRow: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Task name")
                    .font(.headline)
                Text("Due Date")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // ToDo: Add Button action
            Button(action: {}){
                Image(systemName: "ellipsis")
            }
        }
    }
}

#Preview {
    TaskRow()
}
