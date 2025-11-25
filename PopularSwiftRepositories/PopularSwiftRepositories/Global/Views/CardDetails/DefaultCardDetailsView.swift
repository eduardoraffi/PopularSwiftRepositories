import SwiftUI

internal struct DefaultCardDetailsView: View {

    private var userItem: UserProtocol
    private var cardViewType: CardViewType {
        didSet {
            switch self.cardViewType {
            case .prList:
                descriptionLineLimit = 0
            case .repositoryList:
                descriptionLineLimit = 3
            }
        }
    }

    private var descriptionLineLimit: Int = 3

    init(userItem: UserProtocol, cardViewType: CardViewType) {
        self.userItem = userItem
        self.cardViewType = cardViewType
    }

    var body: some View {
        VStack {
            Text(userItem.name)
                .font(.system(size: 16))
                .foregroundColor(.primaryTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .padding([.leading,.top], 10)
            Text(userItem.description)
                .font(.system(size: 12))
                .foregroundColor(.primaryTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(descriptionLineLimit)
                .padding([.leading, .top], 8)
            switch cardViewType {
            case .prList:
                Spacer()
                Text(userItem.creationDate)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top], 8)
                    .foregroundColor(.secondaryTextColor)
            case .repositoryList:
                getCountersComponent()
            }
        }
    }

    @ViewBuilder
    private func getCountersComponent() -> some View {
        HStack {
            CounterWithImage(imageName: Image.branchIcon.description,
                             counter: userItem.forks)
            CounterWithImage(imageName: Image.starIcon.description,
                             counter: userItem.stargazersCount)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .top], 8)
    }

}
