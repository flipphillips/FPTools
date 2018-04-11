(* a possible addition to findpeaks, etc. *)
(* from https://mathematica.stackexchange.com/questions/10640/find-zero-crossing-in-a-list *)

FindZeroCrossings[l_List] := Module[{t, u, v},
    t = {Sign[l], Range[Length[l]]} // Transpose;(*List of-1,0,1 only*)
    u = Select[t, First[#] != 0 &];(*Ignore zeros*)
    v = SplitBy[u, First];(*Group into runs of+and-values*){Most[Max[#[[All, 2]]] & /@ v], 
    Rest[Min[#[[All, 2]]] & /@ v]} // Transpose]

