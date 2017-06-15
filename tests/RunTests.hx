package ;

import tink.unit.*;
import tink.unit.Assert.*;
import tink.testrunner.*;

class RunTests {

  static function main() {
    Runner.run(TestBatch.make([new Test()])).handle(Runner.exit);
  }
  
}

class Test {
  public function new() {}
  
  public function string()
    return assert(ListEnumAbstract.list((null:E1)).join(',') == '1,2,3');
  
  public function int()
    return assert(ListEnumAbstract.list((null:E2)).join(',') == '1,2,3');
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