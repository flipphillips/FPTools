(* a possible addition to findpeaks, etc. *)
(* from https://mathematica.stackexchange.com/questions/10640/find-zero-crossing-in-a-list *)

FindZeroCrossings[l_List] := Module[{t, u, v},
    t = {Sign[l], Range[Length[l]]} // Transpose;(*List of-1,0,1 only*)
    u = Select[t, First[#] != 0 &];(*Ignore zeros*)
    v = SplitBy[u, First];(*Group into runs of+and-values*){Most[Max[#[[All, 2]]] & /@ v], 
    Rest[Min[#[[All, 2]]] & /@ v]} // Transpose]


(* Maybe should be split out as 'Statistics' some day *)
UnitizedGaussianPDF[\[Mu]_, \[Sigma]_] := Module[{pdf},
  pdf = PDF[NormalDistribution[\[Mu], \[Sigma]]];
  Evaluate[pdf[#]/ pdf[\[Mu]]] &]

(* fft centering, ala matlab *)
(* from https://mathematica.stackexchange.com/questions/33574/whats-the-correct-way-to-shift-zero-frequency-to-the-center-of-a-fourier-transf *)

(* note that ImagePeriodogram solves this these days *)

FFTShift[dat_?ArrayQ, k : (_Integer?Positive | All) : All] :=
         Module[{dims = Dimensions[dat]}, 
                RotateRight[dat, If[k === All, Quotient[dims, 2], 
                                    Quotient[dims[[k]], 2] UnitVector[Length[dims], k]]]]

InverseFFTShift[dat_?ArrayQ, k : (_Integer?Positive | All) : All] := 
          Module[{dims = Dimensions[dat]}, 
                 RotateRight[dat, If[k === All, Ceiling[dims/2], 
                                     Ceiling[dims[[k]]/2] UnitVector[Length[dims], k]]]]
