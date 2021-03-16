import SwiftUI

struct BombusTabView: View {
    
    let storageProvider: StorageProvider
    @State private var selection = 2
    
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Place Holder")
                .tabItem {
                    Image(systemName: "house")
                    Text("")
                }.tag(1)
            SessionView(storageProvider: storageProvider)
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("")
                }.tag(2)
            Text("Place Holder")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("")
                }.tag(3)
        }
    }
}

//struct BombusTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        BombusTabView(storageProvider: viewContext)
//    }
//}
