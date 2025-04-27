import SwiftUI

struct Account: Identifiable {
    let id = UUID()
    let balance: Double
    let holderName: String
    let bankName: String
    let color: Color

    static let sampleAccounts: [Account] = [
        Account(balance: 5023.45, holderName: "John Doe", bankName: "Bank of Swift", color: .blue),
        Account(balance: 1234.56, holderName: "Jane Doe", bankName: "iOS Bank", color: .green)
    ]
}
