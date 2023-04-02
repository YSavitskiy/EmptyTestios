import SwiftUI

struct ContentView: View {
    @State var timeString: String? = nil
    private let date = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    private let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""

    var body: some View {
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
