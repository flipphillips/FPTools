(* ::Package:: *)

(* ::Section:: *)
(*GA framework*)


(* ::Text:: *)
(*For super-simple list based GAs. This version treats each allele as a Real-valued {-1,1} thing. *)


GARandomAllele[pos_]:=RandomReal[{-1,1}]


GARandomChromosome[len_:10]:=Table[GARandomAllele[i],{i,1,len}]


GAValidate[chrom_]:=True


Options[GARepopulate]={
	"MutationRate"->0.05,"AlleleFunction"->GARandomAllele,
	"ReplenishmentRate"->0.01,"ReplenishmentFunction"->GARandomChromosome,
	"ValidChromasomeFunction"->GAValidate,"ZombieRate"->0.025,
	"StatisticsFunction"->None};


Options[GAMutate]=Options[GARepopulate];
Options[GACrossover]=Options[GARepopulate];


GAMutate[v_,OptionsPattern[]]:=Module[{loc,mf},
	mf=OptionValue["AlleleFunction"];
	If[mf===None,Return[v]];
	
	If[RandomReal[]>OptionValue["MutationRate"],v,
		loc=RandomInteger[1,Length[v]];
		ReplacePart[v,loc->mf[loc]]]];


GACrossover[v1_,v2_,OptionsPattern[]]:=Module[{xo},
	xo=RandomInteger[{1,Length[v1]-1}];
	{Join[v1[[1;;xo]],v2[[xo+1;;-1]]],
	Join[v2[[1;;xo]],v1[[xo+1;;-1]]]}];


GARepopulate[pop_,fitfunc_,opts:OptionsPattern[]]:=Module[
	{fitvec,np={},pv,sel,kids,gn,meanFit,churn=0,clink=0,n,rf,vq,rr,zr},
	
	(* calculate gene length and population size *)
	gn=Length[First[pop]];
	n=Length[pop];
	
	(* calculate fitness *)
	fitvec=fitfunc/@pop;
	meanFit=Mean[fitvec];
	
	(* this does the forced repopulation if there is total unfitness *)
	pv=Flatten[Position[fitvec,x_/;x>0]];
	rf=OptionValue["ReplenishmentFunction"];
	rr=Round[OptionValue["ReplenishmentRate"]*n];
	zr=Round[OptionValue["ZombieRate"]*n];
	
	np=Join[RandomSample[pop,zr],
		If[Total[fitvec]<1.0 || Length[pv]<2,
		Table[rf[gn],{n}],
		Table[rf[gn],{rr}]]];

	(* this is the main loop *)
	While[Length[np]<n,churn+=1;
		If[churn>2n,Abort[]];
		pv=Flatten[Position[fitvec,x_/;x>=1-RandomReal[]]];
		(* need at least two *)
		If[Length[pv]>=2,
			sel=RandomSample[pv,2];
			kids=(GAMutate[#,opts]&)/@(GACrossover@@pop[[sel]]);
			If[(!SameQ@@kids)&&OptionValue["ValidChromasomeFunction"][#],AppendTo[np,#],clink+=1]&/@kids,
			clink+=1];
		];

	If[OptionValue["StatisticsFunction"]=!=None,OptionValue["StatisticsFunction"][{meanFit,rr,zr,churn-((n-rr-zr)/2),clink}]];
	RandomSample[np[[1;;n]]]
]
