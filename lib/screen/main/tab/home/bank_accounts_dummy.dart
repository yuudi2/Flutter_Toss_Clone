import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 30000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(bankTtoss, 5000000);
final bankAccountKakao = BankAccount(bankKakao, 7000000, accountTypeName: "입출금통장");
final bankAccountKakao2 = BankAccount(bankKakao, 7000000, accountTypeName: "특별통장");


//List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
];

//Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

//Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
};


abstract class Animal {
  void eat();
}

class Dog extends Animal {
  void eat() {
    print('dog');
  }
}

class Cat extends Animal {
  void eat() {
    print('cat');
  }
}

class Cow extends Animal {
  void eat() {
    print('cow');
  }
}

main() {
  //class generic

  final result = doTheWork();
  final result2 = doTheWork2();

  //method or function generic

  final result3 = doTheWork3<Dog>(() => Dog());
  result3.eat();




 // //삽입
 //  bankAccounts.insert(1, bankAccountKakao2);
 //
 //  //위치이동
 //  final temp = bankAccounts.removeAt(4);
 //  bankAccounts.insert(0, temp);
 //
 //  //교환
 //  bankAccounts.swap(0,5);
 //
 //  //변환
 //  bankAccounts.map((e) => e.bank).toList();
 //
 //  //생성
 //  final list = [];
 //
 //  final set = {bankAccountShinhan1, bankAccountShinhan2};
 //  final map = {"shinhan1" : bankAccountShinhan1, "shinhan2": bankAccountShinhan2};
 //
 //
 //  for(final account in bankAccounts) {
 //    print(account.toString());
 //  }
}

class Result<T> {
  final T data;

  Result(this.data);
}

class ResultString {
  final String data;

  ResultString(this.data);
}

class ResultDouble {
  final double data;

  ResultDouble(this.data);
}

Result doTheWork3<Result extends Animal>(Result Function() animalCreator) {
  return animalCreator();
}

Result<String> doTheWork() {
  ///...1
  ///...2
  ///
  /// ..4
  return Result("중요한 데이터");
}

ResultDouble doTheWork2() {
  ///...1
  ///...2
  ///
  /// ..4
  return ResultDouble(5234.44);
}

