

import SwiftUI

struct ProgressCircleView: View {
    var body: some View {
        HStack {
            ForEach(0..<3) { _ in
                Circle()
                    .fill(Color.bombusbAccentColor)
                    .frame(width: 100, height: 100)
            }
        }
        
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView()
    }
}

