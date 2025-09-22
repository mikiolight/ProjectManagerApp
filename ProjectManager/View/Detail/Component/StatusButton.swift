import SwiftUI

// Button View
struct BackIcon: View{
    var body: some View{
        VStack{
            // Icon
            ZStack {
                Image(systemName: "circle")
                Image(systemName: "chevron.left.2")
                    .font(.caption2)
            }
            .font(.largeTitle)
            
            // Caption
            Text("Not Started")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.blue)
    }
}

struct ForwardIcon: View{
    var body: some View{
        VStack{
            // Icon
            ZStack {
                Image(systemName: "circle")
                Image(systemName: "chevron.right.2")
                    .font(.caption2)
            }
            .font(.largeTitle)
            
            // Caption
            Text("In Progress")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.blue)
    }
}

struct CompleteIcon: View{
    var body: some View{
        VStack{
            Image(systemName: "checkmark.circle")
                .font(.largeTitle)
            
            Text("Complete")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .foregroundStyle(.blue)
    }
}

#Preview {
    HStack{
        BackIcon()
        ForwardIcon()
        CompleteIcon()
        Spacer()
    }.padding()
}
