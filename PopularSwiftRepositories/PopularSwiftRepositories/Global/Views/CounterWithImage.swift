import SwiftUI

internal struct CounterWithImage: View {

    private var imageName: String
    private var counter: Int
    private var foregroundColor: Color

    internal init(imageName: String, counter: Int, foregroundColor: Color) {
        self.imageName = imageName
        self.counter = counter
        self.foregroundColor = foregroundColor
    }

    var body: some View {
        Group {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
            Text("\(counter)")
                .font(.system(size: 8))
                .bold()
                .foregroundColor(foregroundColor)
                .lineLimit(1)
        }
    }

}

#Preview {
    HStack {
        CounterWithImage(imageName: "heart.fill", counter: 100000, foregroundColor: .blue)
        CounterWithImage(imageName: "heart.fill", counter: 100000, foregroundColor: .blue)
    }.frame(maxWidth: .infinity, alignment: .leading)
}
