
import SwiftUI

struct BombusTabView: View {
    
    let storageProvider: StorageProvider
    @State private var selection = 2
    
    init(storageProvider: StorageProvider) {
        self.storageProvider = storageProvider
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(.bombusbBackgroundColor)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack {
                Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
                Text("Place Holder")
            }.tabItem {
                    Image(systemName: "house")
                    Text("")
                }.tag(1)
            SessionView(storageProvider: storageProvider)
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("")
                }.tag(2)
            ZStack {
                Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
                Text("Place Holder")
            }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("")
                }.tag(3)
        }
    }
}
