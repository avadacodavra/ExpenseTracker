import SwiftUI

struct BudgetProgressView: View {
    let currentExpense: Double
    let budgetLimit: Double

    var progress: Double {
        min(currentExpense / budgetLimit, 1.0)
    }

    var overBudgetAmount: Double {
        max(currentExpense - budgetLimit, 0)
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(height: 20)
                    .foregroundColor(Color.gray.opacity(0.3))

                Capsule()
                    .frame(width: CGFloat(progress) * UIScreen.main.bounds.width * 0.9, height: 20)
                    .foregroundColor(overBudgetAmount > 0 ? .red : .blue)
                    .animation(.easeInOut, value: progress)
            }

            HStack {
                if overBudgetAmount > 0 {
                    Text("Over budget ($\(String(format: "%.2f", overBudgetAmount)))")
                        .foregroundColor(.red)
                        .font(.footnote)
                        .bold()
                } else {
                    Text("Spent (\(Int(progress * 100))%)")
                        .foregroundColor(.blue)
                        .font(.footnote)
                        .bold()
                }
            }
            .padding(.top, 4)
        }
    }
}

#Preview {
    BudgetProgressView(currentExpense: 750, budgetLimit: 1000)
}
