import SwiftUI

internal struct CounterWithImage: View {

    private var imageName: String
    private var counter: Int

    internal init(imageName: String, counter: Int) {
        self.imageName = imageName
        self.counter = counter
    }

    var body: some View {
        Group {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(.primaryTextColor)
            Text("\(counter)")
                .font(.system(size: 8))
                .bold()
                .foregroundColor(.primaryTextColor)
                .lineLimit(1)
        }
    }

}

#Preview {
    HStack {
        CounterWithImage(imageName: "heart.fill", counter: 100000)
        CounterWithImage(imageName: "heart.fill", counter: 100000)
    }.frame(maxWidth: .infinity, alignment: .leading)
}
