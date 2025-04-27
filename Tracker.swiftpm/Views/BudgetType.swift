import SwiftUI

enum BudgetType {
    case daily, weekly, monthly

    var title: String {
        switch self {
        case .daily: return "Daily"
        case .weekly: return "Weekly"
        case .monthly: return "Monthly"
        }
    }

    var budgetLimit: Double {
        switch self {
        case .daily: return 1000.0
        case .weekly: return 5000.0
        case .monthly: return 20000.0
        }
    }

    func next() -> BudgetType {
        switch self {
        case .daily: return .weekly
        case .weekly: return .monthly
        case .monthly: return .daily
        }
    }
}

