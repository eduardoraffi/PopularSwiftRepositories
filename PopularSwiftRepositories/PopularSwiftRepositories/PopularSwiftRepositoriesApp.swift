import SwiftUI

@main
struct PopularSwiftRepositoriesApp: App {

    internal init() {
        setupNavigationBar()
    }

    var body: some Scene {
        WindowGroup {
            let vm = PopularRepositoriesViewModel()
            PopularRepositoriesView(viewModel: vm).withRouter()
        }
    }

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.secondaryBackgroundColor)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

}
