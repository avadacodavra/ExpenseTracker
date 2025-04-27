import SwiftUI

struct ExpenseListView: View {
    let expenses: [Expense]

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(expenses) { expense in
                    HStack {
                        Image(systemName: expense.category.iconName)
                            .foregroundColor(expense.category.color)
                            .frame(width: 40, height: 40)
                            .background(expense.category.color.opacity(0.2))
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)

                            Text(expense.dateFormatted)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Text("-$\(String(format: "%.2f", expense.amount))")
                            .foregroundColor(.red)
                            .bold()
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ExpenseListView(expenses: Expense.sampleExpenses)
}
