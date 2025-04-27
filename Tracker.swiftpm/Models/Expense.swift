import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
    let date: Date
    let category: ExpenseCategory

    static let sampleExpenses: [Expense] = [
        Expense(name: "Groceries", amount: 150.50, date: Date(), category: .food),
        Expense(name: "Uber Ride", amount: 23.90, date: Date(), category: .transport),
        Expense(name: "Gym Membership", amount: 59.99, date: Date(), category: .personal),
        Expense(name: "Rent", amount: 1200.00, date: Date(), category: .housing)
    ]

    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
