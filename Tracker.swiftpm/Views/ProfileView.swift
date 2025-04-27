import SwiftUI

struct ProfileView: View {
    @Binding var isLoggedIn: Bool
    @EnvironmentObject var userProfile: UserProfile

    var body: some View {
        VStack(spacing: 20) {
            if let image = userProfile.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 5)
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            }

            Text(userProfile.username.isEmpty ? "No Username" : userProfile.username)
                .font(.title)
                .bold()

            Button(action: {
                withAnimation {
                    isLoggedIn = false
                }
            }) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView(isLoggedIn: .constant(true))
        .environmentObject(UserProfile())
}
