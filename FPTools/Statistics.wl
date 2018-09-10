
(* some routines I used to use from the old statistics packages *)

LocationReport[data_] := {Mean -> Mean[data], 
  HarmonicMean -> HarmonicMean[data], Median -> Median[data]} /; VectorQ[data]

ShapeReport[list_] := {
	Skewness -> Skewness[list] ,
	QuartileSkewness -> QuartileSkewness[list] ,
	Kurtosis -> Kurtosis[list]} /; VectorQ[list]

DispersionReport[list_] :=
	{
	Variance -> Variance[list] ,
	StandardDeviation -> StandardDeviation[list] ,
	MinMax -> MinMax[list] ,
	MeanDeviation -> MeanDeviation[list] ,
	MedianDeviation -> MedianDeviation[list] ,
	QuartileDeviation -> QuartileDeviation[list]
	}   /; VectorQ[list]

StandardDeviationMLE[data_] := 
 StandardDeviation[data] Sqrt[(Length[data] - 1)/Length[data]]

VarianceMLE[data_] := Variance[data] (Length[data] - 1)/Length[data]

StandardErrorOfSampleMean[data_] := 
 StandardDeviation[data]/Sqrt[Length[data]]

VarianceOfSampleMean[data_] := Variance[data]/Length[data]

CoefficientOfVariation[data_] := StandardDeviation[data]/Mean[data]

ZeroMean[data_] := data - Mean[data]
