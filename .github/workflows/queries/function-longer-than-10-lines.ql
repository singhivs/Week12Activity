/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function has more than 10 lines.
 */
predicate isFunctionLongerThan10Lines(Function function) {
  exists(FunctionNode fnNode |
    fnNode = function and
    fnNode.getNumLines() > 10
  )
}

from Function function
where isFunctionLongerThan10Lines(function)
select function, "is longer than 10 lines"
