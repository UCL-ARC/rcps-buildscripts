(* ::Package:: *)

Begin["System`Private`"]
(* Hide any symbols which are created *)

protected = Unprotect[$ProcessorCount]
$ProcessorCount = ToExpression [Environment["OMP_NUM_THREADS"]]
protected = Protect [$ProcessorCount]

WriteString [$Output, "Mathematica running on Legion, Grace and Aristotle at UCL"]

End[]
