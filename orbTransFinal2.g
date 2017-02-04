orbTrans := function(G,a,act)

local gens, orb, orbDict, x, g, b, transDict, trans;
gens := GeneratorsOfGroup(G);
orb := [a];
trans := Identity;

orbDict := NewDictionary(a,false);
transDict := NewDictionary(trans,false);

AddDictionary(orbDict,a);
AddDictionary(transDict,a);

for x in orb do
	for g in gens do
		b:= act(x,g);
		if not KnowsDictionary(orbDict,b) then 
			Add(orb,b);
			AddDictionary(orbDict,b);
			trans[x] := act(trans,g);
			Add(x,trans);
			AddDictionary(transDict,trans);
		fi;
	od;
od;

return orb;
end;