extension PopularSwiftRepositoriesModel {

    static func mock() -> Self {
        .init(total_count: 100, incomplete_results: false, items: userItemMockList())
    }

    static func userItemMockList() -> [UserItem] {
        (1...10).map { id in
            UserItem.init(id: id,
                          name: "Username)",
                          fullName: "Username/name",
                          owner: Owner(avatarURL: ""),
                          description: "Description for testing purpouses",
                          stargazersCount: 10000,
                          forks: 1000)
        }
    }

}
