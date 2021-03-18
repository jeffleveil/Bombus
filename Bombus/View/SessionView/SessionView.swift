import SwiftUI

struct SessionView: View {
    
    @ObservedObject var viewModel = ViewModel()
    let storageProvider: StorageProvider
    
    var body: some View {
        ZStack {
            Color.bombusbBackgroundColor.ignoresSafeArea(edges: .all)
            VStack {
                
                ZStack {
                    HoneycombPolygon(radius: 20).foregroundColor(.bombusbAccentColor)
                    
                    HoneycombPolygon(radius: 20)
                        .mask(
                            Color.bombusPrimaryTextColor
                                .mask(
                                    HoneycombPolygon(radius: 20)
                                        .strokeBorder(Color.black.opacity(0.7), lineWidth: 3)
                                        .blur(radius: 15)
                                    
                                    
                                )
                            )
                    Text("\(viewModel.formatter.string(from: viewModel.timerDuration) ?? "Nothing")")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .padding(50)
                        .foregroundColor(.bombusPrimaryTextColor)
                    
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

extension View {
    func innerShadow(color: Color, radius: CGFloat = 0.1) -> some View {
        modifier(InnerShadow(color: color, radius: min(max(0, radius), 1)))
    }
}

private struct InnerShadow: ViewModifier {
    var color: Color = .gray
    var radius: CGFloat = 0.1
    
    private var colors: [Color] {
        [color.opacity(0.75), color.opacity(0.0), .clear]
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .top, endPoint: .bottom)
                            .frame(height: self.radius * self.minSide(geo)),
                         alignment: .top)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .bottom, endPoint: .top)
                            .frame(height: self.radius * self.minSide(geo)),
                         alignment: .bottom)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing)
                            .frame(width: self.radius * self.minSide(geo)),
                         alignment: .leading)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .trailing, endPoint: .leading)
                            .frame(width: self.radius * self.minSide(geo)),
                         alignment: .trailing)
        }
    }
    
    func minSide(_ geo: GeometryProxy) -> CGFloat {
        CGFloat(3) * min(geo.size.width, geo.size.height) / 2
    }
}
