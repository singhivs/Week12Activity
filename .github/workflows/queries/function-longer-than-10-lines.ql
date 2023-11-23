/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than `n` lines.
 */
predicate isFunctionLongerThanNLines(FunctionNode fn, int n) {
  exists(FunctionNode fnNode |
    fnNode = fn and
    fnNode.getNumLines() > n
  )
}

from FunctionNode fn
where isFunctionLongerThanNLines(fn, 10)
select fn, "is longer than 10 lines"
