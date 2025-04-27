import SwiftUI

struct MainTabView: View {
    @Binding var isLoggedIn: Bool
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AddView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }
            
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView(isLoggedIn: .constant(true))
        .environmentObject(UserProfile())
}
