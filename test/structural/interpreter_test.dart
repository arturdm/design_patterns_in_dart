import 'package:test/test.dart';

class RomanInterpreter {
  const RomanInterpreter();

  int interpret(String input) {
    final context = Context(input, 0);
    const expressions = <Expression>[
      ThousandExpression(),
      HundredExpression(),
      TenExpression(),
      OneExpression(),
    ];
    expressions.forEach((expression) => expression.interpret(context));
    return context.output;
  }
}

class Context {
  String input;
  int output;

  Context(this.input, this.output);
}

abstract class Expression {
  const Expression();

  void interpret(Context context) {
    if (context.input.length == 0) {
      return;
    } else if (context.input.startsWith(nine)) {
      context.output += (9 * multiplier);
      context.input = context.input.substring(2);
    } else if (context.input.startsWith(four)) {
      context.output += (4 * multiplier);
      context.input = context.input.substring(2);
    } else if (context.input.startsWith(five)) {
      context.output += (5 * multiplier);
      context.input = context.input.substring(1);
    }
    while (context.input.startsWith(one)) {
      context.output += (1 * multiplier);
      context.input = context.input.substring(1);
    }
  }

  String get one;

  String get four;

  String get five;

  String get nine;

  int get multiplier;
}

class ThousandExpression extends Expression {
  const ThousandExpression();

  @override
  String get one => 'M';

  @override
  String get four => ' ';

  @override
  String get five => ' ';

  @override
  String get nine => ' ';

  @override
  int get multiplier => 1000;
}

class HundredExpression extends Expression {
  const HundredExpression();

  @override
  String get one => 'C';

  @override
  String get four => 'CD';

  @override
  String get five => 'D';

  @override
  String get nine => 'CM';

  @override
  int get multiplier => 100;
}

class TenExpression extends Expression {
  const TenExpression();

  @override
  String get one => 'X';

  @override
  String get four => 'XL';

  @override
  String get five => 'L';

  @override
  String get nine => 'XC';

  @override
  int get multiplier => 10;
}

class OneExpression extends Expression {
  const OneExpression();

  @override
  String get one => 'I';

  @override
  String get four => 'IV';

  @override
  String get five => 'V';

  @override
  String get nine => 'IX';

  @override
  int get multiplier => 1;
}

void main() {
  const interpreter = RomanInterpreter();

  Map.of({
    'I': 1,
    'II': 2,
    'III': 3,
    'IV': 4,
    'V': 5,
    'VI': 6,
    'VII': 7,
    'VIII': 8,
    'IX': 9,
    'X': 10,
    'XL': 40,
    'L': 50,
    'XC': 90,
    'C': 100,
    'CD': 400,
    'D': 500,
    'CM': 900,
    'M': 1000,
    'MCMLXXXVI': 1986,
    'MMMCMXCIX': 3999,
  }).forEach((input, expected) {
    test('should interpret $input as $expected', () {
      expect(interpreter.interpret(input), equals(expected));
    });
  });
}
