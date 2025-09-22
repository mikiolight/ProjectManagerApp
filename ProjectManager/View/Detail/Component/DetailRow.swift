import SwiftUI


struct DetailRow: View{
    let rowHead: String
    let rowContent: String
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(rowHead)
                    .font(.footnote)
                Text(rowContent)
                    .font(.headline)
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    DetailRow(rowHead: "SomeTask", rowContent: "SomeContent to do")
}
