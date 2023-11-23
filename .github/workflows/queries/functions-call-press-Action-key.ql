/**
 * @description Find tests that call a function named "pressActionKey"
 * @kind problem
 * @id javascript/tests-calling-press-action-key
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
 * Holds if `test` contains a call to a function named "pressActionKey".
 */
predicate callsPressActionKey(Function test) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = test and
    call.getACallee().getName() = "pressActionKey"
  )
}

from Function test
where isTest(test) and
      callsPressActionKey(test)
select test
