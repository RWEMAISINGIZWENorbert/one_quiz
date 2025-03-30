
class AccountBalance {
  final double balance;

  AccountBalance({
    required this.balance
  });

  Map<String, double> toJson() => {
    'balance': balance
  };

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      AccountBalance(balance: json['balance']); 
}