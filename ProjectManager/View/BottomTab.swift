import SwiftUI

struct ListBottomTab: View {
    var body: some View {
        TabView{
			TicketForm()
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add Project")
                }
            ListTopTab()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

#Preview {
    ListBottomTab()
}
