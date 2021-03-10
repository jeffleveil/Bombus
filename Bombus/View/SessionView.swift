import SwiftUI

struct SessionView: View {

    let storageProvider: StorageProvider

    var body: some View {
        NavigationView {
            List(storageProvider.getAllSessions(), id: \.self) { session in
                Text("Duration: \(session.duration)")
                    .fontWeight(.semibold)
            }
            .navigationTitle("Sessions")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = StorageProvider()

        let dummySession = Session(context: viewContext.persistentContainer.viewContext)
        dummySession.duration = 25.00
        dummySession.points = 2
        dummySession.start = Date.init(timeIntervalSinceNow: -10)

        return SessionView(storageProvider: viewContext)
    }
}
