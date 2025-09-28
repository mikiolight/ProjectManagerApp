import SwiftUI
import SwiftData

struct ProjectForm: View {
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss

	@State private var newProjectName: String = ""
	@State private var newProjectDescription: String = ""

    var body: some View {
		VStack{
			FormRow(
				contentTitle: "Project*",
				placeholder: "Project Name",
				value: $newProjectName
			)
			FormRow(
				contentTitle: "Description",
				placeholder: "Project Detail",
				value: $newProjectDescription
			)

			Spacer()
		}
		.toolbar {
			ToolbarItem(placement: .bottomBar)
			{
				HStack{
					Button("Cancel"){
						dismiss()
					}

					Spacer()

					Button("Save"){
						saveProject()
					}
				}
			}
		}
	}
	private func saveProject(){
		let newProject = Project(
			tickets: [],
			projectName: newProjectName,
			projectDetails: newProjectDescription
		)
		modelContext.insert(newProject)
		dismiss()
	}
}

#Preview {
	let container: ModelContainer = {
		let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
		do {
			let container = try ModelContainer(for: Project.self, configurations: configuration)
			return container
		} catch {
			fatalError("Failed to create container for preview: \(error.localizedDescription)")
		}
	}()
	return NavigationStack{
		ProjectForm()
			.modelContainer(container)
	}
}
