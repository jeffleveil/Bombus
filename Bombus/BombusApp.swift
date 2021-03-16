import SwiftUI

@main
struct BombusApp: App {

    let storageProvider = StorageProvider()

    var body: some Scene {

        WindowGroup {
            BombusTabView(storageProvider: storageProvider)
        }

    }
}
