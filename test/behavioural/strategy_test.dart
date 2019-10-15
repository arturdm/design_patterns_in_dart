import 'package:meta/meta.dart';
import 'package:test_api/test_api.dart';

class TestSubject {
  final double pupilDiameter;
  final double blushResponse;
  final bool isOrganic;
  
  TestSubject({@required this.pupilDiameter, @required this.blushResponse, @required this.isOrganic});
}

abstract class RealnessTesting {
  bool testRealness(TestSubject testSubject);
}

class VoightKampffTest implements RealnessTesting {
  @override
  bool testRealness(TestSubject testSubject) {
    return testSubject.pupilDiameter < 30.0 || testSubject.blushResponse != 0.0;
  }
}

class GeneticTest implements RealnessTesting {
  @override
  bool testRealness(TestSubject testSubject) {
    return testSubject.isOrganic;
  }
}

class BladeRunner {
  final RealnessTesting _strategy;

  BladeRunner(this._strategy);
  
  bool testIfAndroid(TestSubject testSubject) {
    return !_strategy.testRealness(testSubject);
  }
}

void main() {
  TestSubject rachel = TestSubject(pupilDiameter: 30.2, blushResponse: 0.3, isOrganic: false);
  
  test("Deckard's method should return false for Rachel", () {
    // given
    BladeRunner deckard = BladeRunner(VoightKampffTest());

    // when
    bool isRachelAndroid = deckard.testIfAndroid(rachel);
    
    // then
    expect(isRachelAndroid, isFalse);
  });
  
  test("Gaff's method should return true for Rachel", () {
    // given
    BladeRunner gaff = BladeRunner(GeneticTest());
  
    // when
    bool isRachelAndroid = gaff.testIfAndroid(rachel);
  
    // then
    expect(isRachelAndroid, isTrue);
  });
}
