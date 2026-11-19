// Student: [ENTER YOUR FULL NAME]
// Reg no: 26710
const String regNo = '26710';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by YOUR INITIALS
int momoFee(int amount) {
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// by YOUR INITIALS
String formatRwf(int amount) {
  String digits = amount.abs().toString();
  String result = '';
  int i = 0;

  while (i < digits.length) {
    result += digits[i];
    int remaining = digits.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      result += ',';
    }
    i++;
  }

  if (amount < 0) {
    result = '-$result';
  }
  return '$result RWF';
}

// by YOUR INITIALS
bool isValidPin(String pin) {
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    if (!RegExp(r'^[0-9]$').hasMatch(pin[i])) {
      return false;
    }
    i++;
  }

  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
      break;
    }
    i++;
  }

  return !allSame;
}

// by YOUR INITIALS
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by YOUR INITIALS
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;
  print('Airtime purchased: ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by YOUR INITIALS
  print('Reg no: $regNo | D = $d | T = $t');
  print("PIN 12345: ${isValidPin('12345')}");
  print("PIN 77777: ${isValidPin('77777')}");
  print("PIN 4821: ${isValidPin('4821')}");
  print("PIN 48a21: ${isValidPin('48a21')}");
  print('PIN 4821$d: ${isValidPin('4821$d')}');

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int amount = (d + 1) * 3000;
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Tests and expected output:
  // formatRwf(0) -> 0 RWF
  print(formatRwf(0));
  // formatRwf(999) -> 999 RWF
  print(formatRwf(999));
  // formatRwf(1000) -> 1,000 RWF
  print(formatRwf(1000));
  // formatRwf(1250000) -> 1,250,000 RWF
  print(formatRwf(1250000));
  // formatRwf(-5000) -> -5,000 RWF
  print(formatRwf(-5000));
  // isValidPin('12345') -> false
  print(isValidPin('12345'));
  // isValidPin('77777') -> false
  print(isValidPin('77777'));
  // isValidPin('48219') -> true
  print(isValidPin('48219'));
  // isValidPin('12a45') -> false
  print(isValidPin('12a45'));
  // isValidPin('1111') -> false (wrong length)
  print(isValidPin('1111'));
}
