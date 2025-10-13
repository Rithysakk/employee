class BankAccount {
  final int id; 
  final String ownerName; 
  double _balance = 0; 

  BankAccount({
    required this.id,
    required this.ownerName,
  });

  String get balance => 'Balance: \$$_balance';

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be positive!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdraw amount must be positive!');
    }
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {}; 

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    final newAccount = BankAccount(id: accountId, ownerName: accountOwner);
    _accounts[accountId] = newAccount;
    return newAccount;
  }

  BankAccount? getAccount(int accountId) => _accounts[accountId];
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); 

  ronanAccount.credit(100);
  print(ronanAccount.balance); 

  ronanAccount.withdraw(50);
  print(ronanAccount.balance); 

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e); 
  }

  try {
    myBank.createAccount(100, 'Honlgy');
  } catch (e) {
    print(e); 
  }
}
