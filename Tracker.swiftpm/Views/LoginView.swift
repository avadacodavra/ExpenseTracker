import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @EnvironmentObject var userProfile: UserProfile

    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var isFirstStepDone = false

    var body: some View {
        VStack {
            if !isFirstStepDone {
                // First Step: Email + Password
                Text("Login")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    withAnimation {
                        isFirstStepDone = true
                    }
                }) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            } else {
                // Second Step: Profile Pic + Username
                Text("Create Profile")
                    .font(.largeTitle)
                    .padding()

                Button(action: {
                    showImagePicker = true
                }) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .shadow(radius: 5)
                            .padding()
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(isPresented: $showImagePicker, selectedImage: $selectedImage)
                }

                TextField("Enter Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    userProfile.email = email
                    userProfile.username = username
                    userProfile.profileImage = selectedImage
                    withAnimation {
                        isLoggedIn = true
                    }
                }) {
                    Text("Finish")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
        .padding()
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
        .environmentObject(UserProfile())
}
