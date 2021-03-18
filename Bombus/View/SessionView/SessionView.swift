import SwiftUI

struct SessionView: View {
    
    @ObservedObject var viewModel = ViewModel()
    let storageProvider: StorageProvider
    
    var body: some View {
        ZStack {
            Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
            VStack {
                
                ZStack {
                    
                    Honeycomb()
                    
                    Text("\(viewModel.formatter.string(from: viewModel.timerDuration) ?? "Nothing")")
                        .timerTextStyle()
                    
                }
                .frame(height: 320)
                .padding(.vertical, 50)
                
                
                Spacer()
                
                Button(action: {
                    viewModel.startTimer() // This is not adopting the MVVM paradigm
                }, label: {
                    // Let's place this into a ButtonStyleModifier so we dont clog the view
                    Text("Start Timer")
                }).primaryButtonStyle().padding(.bottom, 10)
            }
            .navigationTitle("Sessions")
        }
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
