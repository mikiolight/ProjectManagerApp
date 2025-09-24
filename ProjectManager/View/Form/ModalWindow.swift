// ModalWidow to select someItems
import SwiftUI

struct ModalWindow: View {
    @Bind projects: [Project]
    var body: some View {
        List(projects){ project in
            Text(project.projectName)
    		}.listStyle(.plain)
    }
}

#Preview {
    ModalWindow()
}
