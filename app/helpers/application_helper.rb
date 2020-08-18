module ApplicationHelper
  def balance_calc wallet
    deposits = wallet.transactions.deposits
    expenses = wallet.transactions.expenses
    deposits.sum(&:amount) - expenses.sum(&:amount)
  end
end
