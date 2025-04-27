import SwiftUI

class UserProfile: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var profileImage: UIImage? = nil
}
