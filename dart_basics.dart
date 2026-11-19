// Student: [ENTER YOUR FULL NAME]
// Reg no: 26710
const String regNo = '26710';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by YOUR INITIALS
int countVowels(String text) {
  String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }
  return count;
}

// by YOUR INITIALS
String initials(String fullName) {
  String cleaned = fullName.trim();
  if (cleaned.isEmpty) {
    return '';
  }

  List<String> names = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;

  while (i < names.length) {
    result += names[i][0].toUpperCase() + '.';
    i++;
  }
  return result;
}

// by YOUR INITIALS
void drawTriangle(int height) {
  if (height <= 0) {
    return;
  }

  int row = 1;
  while (row <= height) {
    String spaces = List.filled(height - row, ' ').join();
    String symbol = row % 2 == 0 ? '#' : '*';
    String symbols = List.filled(row, symbol).join();
    print(spaces + symbols);
    row++;
  }
}

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
String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }
  String stars = List.filled(5, '*').join();
  return phone.substring(0, 3) + stars + phone.substring(8);
}

void main() {
  // by YOUR INITIALS
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = '[ENTER YOUR FULL NAME]';
  print('$fullName has ${countVowels(fullName)} vowels');
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }

  print('Total fees: $totalFees RWF');
}
