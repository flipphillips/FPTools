(* ::Package:: *)

(* ::Subsection:: *)
(*LatLon / Rectangular Mapping*)


(* ::Text:: *)
(*u,v on 0-1. technically 'spherical' and not phi theta. nomenclature me.*)


(* ::Input::Initialization:: *)
RectangularToPhiTheta[{u_,v_}]:={2\[Pi] u,\[Pi](v-1)}


(* ::Input::Initialization:: *)
PhiThetaToDirection[{\[Phi]_,\[Theta]_}]:={Sin[\[Phi]]Sin[\[Theta]],Cos[\[Theta]],-Cos[\[Phi]]Sin[\[Theta]]}


(* ::Input::Initialization:: *)
RectangularToDirection[{u_,v_}]:=PhiThetaToDirection[RectangularToPhiTheta[{u,v}]]


(* ::Input::Initialization:: *)
DirectionToRectangular[{dx_,dy_,dz_}]:={1+1/\[Pi] ArcTan[-dz,dx],1/\[Pi] ArcCos[dy]}


(* ::Subsection:: *)
(*Angular Mapping*)


(* ::Text:: *)
(*u, v on 0 - 1. *)


(* ::Input::Initialization:: *)
CircularToAngular[{u_,v_}]:={ArcTan[2u-1,1-2v],\[Pi] Sqrt[(2u-1)^2+(2v-1)^2]}


(* ::Input::Initialization:: *)
AngularToDirection[{\[Theta]_,\[Phi]_}]:={Cos[\[Theta]]Sin[\[Phi]],Sin[\[Theta]]Sin[\[Phi]],-Cos[\[Phi]]}


(* ::Input::Initialization:: *)
CircularToDirection[{u_,v_}]:=AngularToDirection[CircularToAngular[{u,v}]]


(* ::Input::Initialization:: *)
DirectionToCircular[{dx_,dy_,dz_}]:=1/2+ArcCos[-dz/(2\[Pi] Sqrt[dx^2+dy^2])]{dx,dy}


(* ::Subsection:: *)
(*Cube Mapping*)


(* ::Text:: *)
(*some other time*)


ToCartesianRules[] := 
  MapThread[
   Rule, {{r, \[Theta], \[Phi]}, ToSphericalCoordinates[{x, y, z}]}];

ToSphericalRules[] := 
  MapThread[
   Rule, {{x, y, z}, 
    FromSphericalCoordinates[{r, \[Theta], \[Phi]}]}];