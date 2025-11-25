extension PopularSwiftRepositoriesModel {

    func mock() -> Self {
        .init(total_count: 100, incomplete_results: false, items: userItemMockList())
    }

    func userItemMockList() -> [UserItem] {
        (1...10).map { id in
            UserItem.init(id: id,
                          name: "Username)",
                          fullName: "Username/name",
                          owner: Owner(avatarURL: ""),
                          description: "Description for testing purpouses",
                          stargazersCount: Int.random(in: 1000...10000),
                          forks: Int.random(in: 1000...10000))
        }
    }

}
