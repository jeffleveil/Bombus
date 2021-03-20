
import SwiftUI

struct BombusTabView: View {
    
    let storageProvider: StorageProvider
    @State private var selection = 2
    
    init(storageProvider: StorageProvider) {
        self.storageProvider = storageProvider
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(.bombusbBackgroundColor)
        UITabBar.appearance().unselectedItemTintColor = UIColor(.bombusbAccentColor)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ZStack {
                Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
                Text("Place Holder")
            }.tabItem {
                Image(systemName: "house.fill").font(Font.system(size: 20, weight: .semibold))
                Text("")
            }.tag(1)
            SessionView(storageProvider: storageProvider)
                .tabItem {
                    Image(systemName: "stopwatch.fill").font(Font.system(size: 20, weight: .semibold))
                    Text("")
                }.tag(2)
            ZStack {
                Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
                Text("Place Holder")
            }
            .tabItem {
                Image(systemName: "person.3.fill").font(Font.system(size: 20, weight: .semibold))
                Text("")
            }.tag(3)
        }.accentColor(.bombusPrimaryTextColor)
    }
}
