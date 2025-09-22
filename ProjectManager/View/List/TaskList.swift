import SwiftUI

struct TaskList: View {
    var body: some View {
        List{
            TaskRow()
            TaskRow()
        }
    }
}

#Preview {
    TaskList()
}
