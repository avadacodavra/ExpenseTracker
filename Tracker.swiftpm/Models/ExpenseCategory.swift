import SwiftUI

enum ExpenseCategory {
    case housing, food, transport, personal

    var iconName: String {
        switch self {
        case .housing: return "house.fill"
        case .food: return "cart.fill"
        case .transport: return "car.fill"
        case .personal: return "person.fill"
        }
    }

    var color: Color {
        switch self {
        case .housing: return .purple
        case .food: return .orange
        case .transport: return .blue
        case .personal: return .pink
        }
    }
}
