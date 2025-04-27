import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userProfile: UserProfile

    @State private var selectedAccountIndex = 0
    @State private var selectedBudgetType: BudgetType = .daily

    let accounts: [Account] = Account.sampleAccounts
    let expenses: [Expense] = Expense.sampleExpenses

    // Define total swipe indicator width
    let indicatorWidth: CGFloat = 8

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // Hello {username}
                Text("Hello, \(userProfile.username.isEmpty ? "User" : userProfile.username)!")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                // Account Card View with Swipe Indicator
                VStack(spacing: 5) {
                    ZStack(alignment: .bottom) {
                        TabView(selection: $selectedAccountIndex) {
                            ForEach(accounts.indices, id: \.self) { index in
                                AccountCardView(account: accounts[index])
                                    .padding(.horizontal)
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 200)
                        
                        // Dynamic Swipe Indicator
                        HStack {
                            Spacer()
                            Circle()
                                .frame(width: indicatorWidth, height: indicatorWidth)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                                .padding(.bottom, 10)
                                .offset(x: CGFloat(selectedAccountIndex) * (indicatorWidth * 2))  // Move indicator with swipe
                            Spacer()
                        }
                    }
                }

                // Daily/Weekly/Monthly Budget
                HStack {
                    Text("\(selectedBudgetType.title) Budget")
                        .font(.title3)
                        .bold()

                    Spacer()

                    Button(action: {
                        // Toggle between daily, weekly, monthly budget
                        withAnimation {
                            selectedBudgetType = selectedBudgetType.next()
                        }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)

                // Budget Progress Bar
                BudgetProgressView(currentExpense: 750, budgetLimit: selectedBudgetType.budgetLimit)
                    .padding(.horizontal)

                // Recent Expenses Section
                Text("Recent Expenses")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)

                // Recent Expenses List (scrollable)
                ExpenseListView(expenses: expenses)
                    .frame(height: 250) // Limit list height for scrollability
                    .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color.white) // Set background color to prevent scrolling the whole screen
    }
}

#Preview {
    HomeView()
        .environmentObject(UserProfile())
}
