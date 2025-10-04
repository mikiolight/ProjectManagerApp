// ModalWidow to select someItems
import SwiftUI
import SwiftData

struct ModalWindow: View {
	@Query(sort: \Project.projectName) var projects: [Project]

	@Binding var isPresented: Bool
	@Binding var selectedItem: Project?

	@State private var searchText = ""
	var body: some View {
		NavigationStack {
			VStack(spacing: 0) {
				NavigationLink(destination: ProjectForm()){
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
			.navigationTitle("Select Project")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}


#Preview {
	// プレビュー用の状態を管理するラッパービュー
	struct PreviewWrapper: View {
		@State private var isPresented = true
		// 初期値を設定し、プレビュー内で変更可能にする
		@State private var selectedItem: Project? = SampleData.projects.first

		var body: some View {
			ModalWindow(
				isPresented: $isPresented,
				selectedItem: $selectedItem
			)
		}
	}
	let container: ModelContainer = {
		let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
		do{
			let container = try ModelContainer(
				for: Project.self,
				Ticket.self,
				Note.self,
				configurations: configuration
			)
			for project in SampleData.projects {
				container.mainContext.insert(project)
			}
			return container
		} catch {
			fatalError("Failed to create container for preview: \(error.localizedDescription)")
		}
	}()

	return PreviewWrapper()
		.modelContainer(container)
}
