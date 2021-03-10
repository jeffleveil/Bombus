import SwiftUI

struct SessionView: View {

    @ObservedObject var viewModel: ViewModel
    let storageProvider: StorageProvider

    var body: some View {
            VStack {
                // Let's place this into a ButtonStyleModifier so we dont clog the view
                Text("\(viewModel.formatter.string(from: viewModel.timerDuration) ?? "Nothing")")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .fontWeight(.bold)
                    .padding(50)

                Spacer()

                Button(action: {
                    viewModel.startTimer()
                }, label: {
                    // Let's place this into a ButtonStyleModifier so we dont clog the view
                    Text("Start Timer")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50) // Hardcoded for now to see how it looks
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                })
            }
            .navigationTitle("Sessions")
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = StorageProvider()

        let dummySession = Session(context: viewContext.persistentContainer.viewContext)
        dummySession.duration = 25.00
        dummySession.points = 2
        dummySession.start = Date.init(timeIntervalSinceNow: -10)

        return SessionView(viewModel: SessionView.ViewModel(), storageProvider: viewContext)
    }
}