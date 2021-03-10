import SwiftUI

@main
struct BombusApp: App {

    let storageProvider = StorageProvider()
    let sessionViewModel = SessionView.ViewModel()

    var body: some Scene {

        WindowGroup {
            SessionView(viewModel: sessionViewModel, storageProvider: storageProvider)
        }

    }
}
