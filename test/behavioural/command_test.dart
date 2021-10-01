import 'package:test/test.dart';

void main() {
  test("should process order commands", () {
    // given
    final cook = Cook();
    final cakeCommand = CakeOrderCommand(receiver: cook, cakeName: "cheesecake");
    final coffeeCommand = CoffeeOrderCommand(receiver: cook, coffeeName: "latte");
    final waiter = Invoker();

    // when
    waiter.placeOrder(cakeCommand);
    waiter.placeOrder(coffeeCommand);

    // then
    final actualOrder = cook.getOrder();
    expect(actualOrder, equals("cheesecake, latte"));
  });
}

abstract class Command {
  void execute();
}

class CakeOrderCommand implements Command {
  final Cook receiver;
  final String cakeName;

  CakeOrderCommand({
    required this.receiver,
    required this.cakeName,
  });

  @override
  void execute() {
    receiver.prepareCake(cakeName);
  }
}

class CoffeeOrderCommand implements Command {
  final Cook receiver;
  final String coffeeName;

  CoffeeOrderCommand({
    required this.receiver,
    required this.coffeeName,
  });

  @override
  void execute() {
    receiver.prepareCoffee(coffeeName);
  }
}

class Cook {
  var _currentOrder = "";

  void prepareCake(String name) {
    _appendOrder(name);
  }

  void prepareCoffee(String name) {
    _appendOrder(name);
  }

  void _appendOrder(String name) {
    _currentOrder = _currentOrder.isEmpty ? name : "$_currentOrder, $name";
  }

  String getOrder() {
    return _currentOrder;
  }
}

class Invoker {
  void placeOrder(Command command) {
    command.execute();
  }
}
