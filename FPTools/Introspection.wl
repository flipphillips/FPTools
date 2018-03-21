(* ::Package:: *)

(* 
 * Original Spelunk code by Simon Woods.  
 * http://mathematica.stackexchange.com/a/15948
 *)

defboxes[symbol_Symbol] := Hold[symbol] /. _[sym_] :>
        If[MemberQ[Attributes[sym], Locked], "Locked",
          Internal`InheritedBlock[{sym},
            Unprotect[sym]; ClearAttributes[sym, ReadProtected];
            Quiet@Check[ToBoxes[Definition@sym], "DefError"] /. 
            InterpretationBox[a_, b___] :> a ]];

defboxes[s_String] := defboxes[#] &@ToExpression[s, InputForm, Unevaluated]

prettyboxes[boxes_] := 
  boxes /. {" "} -> {"\n-----------\n"} //. {RowBox[{left___, ";", 
       next : Except["\n"], right___}] :> 
     RowBox[{left, ";", "\n", "\t", next, right}], 
    RowBox[{sc : ("Block" | "Module" | "With"), "[", 
       RowBox[{vars_, ",", body_}], "]"}] :> 
     RowBox[{sc, "[", RowBox[{vars, ",", "\n\t", body}], "]"}]};

fancydefinition[symbol_Symbol] :=
  Cell[BoxData[
    prettyboxes[
     defboxes[symbol] /. 
      s_String?(StringMatchQ[#, __ ~~ "`" ~~ __] &) :> 
       First@StringCases[s, 
         a : (__ ~~ "`" ~~ b__) :> processsymbol[a, b]]]],"Output", 
   ShowStringCharacters -> True,
   Background -> RGBColor[1, 0.95, 0.9],
   CellGroupingRules->"OutputGrouping",
   GeneratedCell->True,
   CellAutoOverwrite->True,
   ShowAutoStyles->True,
   LanguageCategory->"Mathematica",
   FontWeight->"Bold"
   ];

processsymbol[a_, b_] := Module[{db},
  Which[
   ! StringFreeQ[a, "\""], a,
   ! StringFreeQ[a, "_"] || (db = defboxes[a]) === "Null", 
   TooltipBox[b, a],
   db === "Locked", TooltipBox[b, a <> "\nLocked Symbol"],
   db === "DefError", TooltipBox[b, a <> "\nError getting Definition"],
   True, ActionMenuBox[TooltipBox[StyleBox[b, FontVariations->{"Underline"->True}], a], {"Discover function" :> Spelunk[a], "Copy full name" :> CopyToClipboard@Cell[a, "Input"]},
                       DefaultBaseStyle -> {"Input"}, Appearance->"None", Evaluator -> Automatic]
   ]]

Spelunk[symbol_Symbol] := CellPrint[fancydefinition[symbol]];

Spelunk[s_String] := CellPrint[fancydefinition[#] &@ToExpression[s, InputForm, Unevaluated]];

SetAttributes[{defboxes, fancydefinition, Spelunk}, HoldFirst] 


PropertiesAvailability[obj_] := Module[{plist,evals,missing,not},
  plist=obj["Properties"];
  evals=Quiet[Check[obj[#],Missing[#]]&/@plist];
  missing=(MissingQ[#]||(Head[#]===obj))&/@evals;
  not = Pick[plist,missing];
  <|"Available"->Complement[plist, not],"Missing"->not|>]


PropertiesDataset[thing_] := Module[{t, u},
  Dataset[
   <|# -> 
     If[AtomQ[t = thing[#]], 
        <|"Value"->t|>,
        If[
         Length[u = Union[t]] == 1, <|"Head"->Head[t], "Shape"->Length[t], "Value"->u|>, 
         <|"Head"->Head[t],"Shape"->Dimensions[t], "Value"->Short[t]|>]]|> & /@ 
   PropertiesAvailability[thing]["Available"]]]


SetAttributes[{PropertiesAvailability, PropertiesDataset}, HoldFirst]
