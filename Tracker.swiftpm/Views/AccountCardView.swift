import SwiftUI

struct AccountCardView: View {
    let account: Account

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("$\(String(format: "%.2f", account.balance))")
                .font(.title)
                .bold()

            Text("Balance")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()

            VStack(alignment: .leading, spacing: 2) {
                Text(account.holderName)
                    .font(.footnote)
                    .bold()
                Text(account.bankName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(account.color)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    AccountCardView(account: Account.sampleAccounts[0])
}
