// ModalWidow to select someItems
import SwiftUI
import SwiftData

struct ModalWindow: View {
	@Query var projects: [Project]

	@Binding var isPresented: Bool
	@Binding var selectedItem: Project?

	@State private var searchText = ""
	var body: some View {
		NavigationStack {
			VStack(spacing: 0) {

				Button(action: {
					// TODO: 新規作成の処理をここに書く
				}) {
					HStack {
						Image(systemName: "pencil")
						Text("New")
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding()
				}

				List {
					ForEach(projects, id: \.id) { project in
						Button(action:{
							selectedItem = project
							print("tapconsole" + project.projectName)
							if let name = selectedItem?.projectName {
								print(name)
							}
						}){
							HStack {
								Image(systemName: selectedItem?.id == project.id ? "record.circle" : "circle")
									.foregroundColor(.accentColor)
								Text(project.projectName)
								Spacer()
							}
							.buttonStyle(.borderless)
						}
					}
				}
				.listStyle(.plain)

				Divider()

				HStack {
					Button("Clear") {
						selectedItem = nil
					}
					Spacer()
					Button("Done") {
						isPresented = false
					}
					.bold()
				}
				.padding()
			}
			.searchable(text: $searchText, prompt: "Search")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}


#Preview {
	ModalWindow(
		isPresented: .constant(true),
		selectedItem: .constant(SampleData.projects.first)
	)
}
