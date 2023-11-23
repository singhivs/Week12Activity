import javascript

/**
 * Holds if a function is longer than 10 lines.
 */

predicate isFunctionLongerThanNLines(FunctionNode fn, int n) {
  fn.getNumLines() > n
}

from FunctionNode fn
where isFunctionLongerThanNLines(fn, 10)
select fn
