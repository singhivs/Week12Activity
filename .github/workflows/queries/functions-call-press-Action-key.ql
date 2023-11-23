/**
 * @description Find tests calling a function named "pressActionKey" transitively
 * @kind problem
 * @id javascript/tests-calling-press-action-key-transitively
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Holds if `caller` contains a call to `callee` with a specific name, transitively.
 */
predicate callsFunctionWithNameTransitively(Function caller, string functionName) {
  exists(DataFlow::CallNode+ call |
    call.getEnclosingFunction() = caller and
    call.getACallee().getName() = functionName
  )
}

from Function test
where isTest(test) and
      callsFunctionWithNameTransitively(test, "pressActionKey")
select test
