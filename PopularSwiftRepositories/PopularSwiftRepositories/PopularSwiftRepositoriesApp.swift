import SwiftUI

@main
struct PopularSwiftRepositoriesApp: App {
    
    var body: some Scene {
        WindowGroup {
            PopularRepositoriesListView().withRouter()
        }
    }

}
