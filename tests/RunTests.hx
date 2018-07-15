package ;

import tink.unit.*;
import tink.unit.Assert.*;
import tink.testrunner.*;

class RunTests {

  static function main() {
    Runner.run(TestBatch.make([new Test()])).handle(Runner.exit);
  }
  
}

@:asserts
class Test {
  public function new() {}
  
  public function string() {
    asserts.assert(ListEnumAbstract.list(E1).join(',') == '1,2,3');
    asserts.assert(ListEnumAbstract.count(E1) == 3);
    return asserts.done();
  }
  
  public function int() {
    asserts.assert(ListEnumAbstract.list(E2).join(',') == '1,2,3');
    asserts.assert(ListEnumAbstract.count(E2) == 3);
    return asserts.done();
  }
    
  public function excludeInlineVar() {
    asserts.assert(ListEnumAbstract.list(E3).join(',') == '1,2,3');
    asserts.assert(ListEnumAbstract.count(E3) == 3);
    return asserts.done();
  }
  
  #if (haxe_ver >= 4)
  public function haxe4() {
    asserts.assert(ListEnumAbstract.list(E4).join(',') == '1,2,3');
    asserts.assert(ListEnumAbstract.count(E4) == 3);
    return asserts.done();
  }
  #end
}

@:enum
abstract E1(String) {
  var Entry1 = '1';
  var Entry2 = '2';
  var Entry3 = '3';
}

@:enum
abstract E2(Int) {
  var Entry1 = 1;
  var Entry2 = 2;
  var Entry3 = 3;
}

@:enum
abstract E3(Int) from Int {
  public static inline var PUBLIC:E3 = 4;
  static inline var PRIVATE:E3 = 5;
  var Entry1 = 1;
  var Entry2 = 2;
  var Entry3 = 3;
}

#if (haxe_ver >= 4)
enum abstract E4(Int) {
  var Entry1 = 1;
  var Entry2 = 2;
  var Entry3 = 3;
}
#end