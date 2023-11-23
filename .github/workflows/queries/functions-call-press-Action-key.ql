import javascript

/**
 * Holds if a test calls a function named "pressActionKey"
 */
predicate isTestCallingFunction(FunctionNode test, string functionName) {
  exists(FunctionCall call |
    call.getTarget() = test and
    call.getTarget().getName() = functionName
  )
}

from FunctionNode test
where isTestCallingFunction(test, "pressActionKey")
select test
