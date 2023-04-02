import SwiftUI

struct ContentView: View {
    @State var timeString: String? = nil
    private let date = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    private let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500).ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(timeString ?? time())
                Text("\(version) b\(build)")
            }.onReceive(timer) { _ in
                self.timeString = time()
            }
        }
    }

    private func time() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd LLLL, hh:mm:ss"
        return formatter.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
