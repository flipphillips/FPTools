(* varios forms of syntatic sugar *)


ApplyIf[f_, g_, x_] := If[TrueQ[f[x]], g[x], x];
ApplyIf[f_, g_][x_] := ApplyIf[f, g, x];


ToCartesianRules[] := 
  MapThread[
   Rule, {{r, \[Theta], \[Phi]}, ToSphericalCoordinates[{x, y, z}]}]

ToSphericalRules[] := 
  MapThread[
   Rule, {{x, y, z}, 
    FromSphericalCoordinates[{r, \[Theta], \[Phi]}]}];