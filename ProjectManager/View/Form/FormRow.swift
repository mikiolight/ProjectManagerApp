import SwiftUI

struct FormRow: View
{
	let contentTitle: String
	let placeholder: String
	@Binding var value: String

	var body: some View
	{
		VStack(alignment: .leading)
		{
			Text(contentTitle)
			TextField(placeholder, text: $value)
				.padding()
				.overlay(
					RoundedRectangle(cornerRadius: 8)
						.stroke(Color(.systemGray4), lineWidth: 1)
				)
		}
		.padding()
	}
}



struct FormDateRow: View
{
	let contentTitle: String
	@Binding var value: Date?
	var body: some View
	{
		HStack{
			VStack(alignment: .leading){
				Text(contentTitle)
				DatePicker("",
						   selection: Binding(
							get: { self.value ?? Date() },
							set: { self.value = $0 }
						   ),
						   displayedComponents: .date
				)
				.labelsHidden()
				.overlay(
					RoundedRectangle(cornerRadius: 8)
						.stroke(Color(.systemGray4), lineWidth: 1)
					)
			}
			.padding()

			Spacer()
		}
	}
}

#Preview
{
	struct PreviewWrapper: View{
		@State private var textValue: String = ""
		@State private var dateValue: Date? = nil
		var body: some View
		{
			FormRow(contentTitle: "Ticket*", placeholder: "Ticket Name", value: $textValue)
			FormDateRow(contentTitle: "Start Date", value: $dateValue)
		}
	}
	return PreviewWrapper()
}
