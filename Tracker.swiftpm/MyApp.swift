import SwiftUI

@main
struct TrackerApp: App {
    @StateObject var userProfile = UserProfile()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userProfile)
        }
    }
}
