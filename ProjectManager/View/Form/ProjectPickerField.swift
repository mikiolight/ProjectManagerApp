import SwiftUI

struct ProjectPickerField: View {
	@Binding var selected: Project?
	var placeholder: String = "Select Project"
	var actions: () -> Void

	var body: some View {
		Button(action: actions) {
			HStack {
				Text(selected?.projectName ?? placeholder)
					.foregroundColor(selected == nil ? .secondary : .primary)
				Spacer()
				Image(systemName: "chevron.down")
					.foregroundColor(.secondary)
			}
			.padding(.vertical, 10)
			.padding(.horizontal)
			.background(
				RoundedRectangle(cornerRadius: 8)
					.stroke(Color.secondary.opacity(0.4))
			)
		}
		.buttonStyle(PlainButtonStyle())
	}
}
