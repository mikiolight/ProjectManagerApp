import SwiftUI
import SwiftData

struct ContentView: View {
	var body: some View {
		StatusTab()
	}
}

#Preview {
	// Preview用のContainer設定
	let container: ModelContainer={
		let configuration = ModelConfiguration(isStoredInMemoryOnly:true)
		do{
			// コンテナの作成
			let container = try ModelContainer(for: Project.self, Ticket.self, Note.self, configurations: configuration)

			// サンプル挿入
			for project in SampleData.projects {
				container.mainContext.insert(project)
			}

			return container
		}catch{
			fatalError("Failed to create container for preview: \(error.localizedDescription)")
		}
	}()

	ContentView()
		.modelContainer(container)
}
