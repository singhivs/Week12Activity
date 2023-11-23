/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id typescript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import typescript

from FunctionNode function
where function.getNumLines() > 10
select function
