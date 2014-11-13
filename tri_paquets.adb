with type_projet;
package body tri_paquets is

--Place sur le premier triangle
procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out AListePoly; CaseCour : out integer)is 
	Ptab: type_projet.AccEns_Poly;
	i: integer:=0;
begin
	Ptab:=APoly;
	if (Ptab /= Nill) then 
		Pp:= Ptab.all[i];
		i:=i+1;
		if (Pp == Nill) then
			while (i < and Pp==Nill) loop
				Pp:=Ptab.all[i];
				i:= i+1;	
		end loop;
		end if;
		CaseCour:=i;
	end if;

end demarrer;

--Renvoi les infos sur l'elem en cours
function elemCourant(Pp: in AListePoly) return AccPoinstFaces is
pFacesTemp: pointsFace 
	begin
		return Pp.all.Poly;
end element;
--Fait avancer de 1 element
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out AListePoly; CaseCour: in out integer);

	begin
		if (Pp.all.succ /= Nill) then 
			Pp:= Pp.all.succ;
		else 
			while (APoly.all[CaseCour+1] /= Nill) loop
				CaseCour:=CaseCour+1;
			end loop;
			Pp:= APoly.all[CaseCour];
		end if;
end avancer;

--Vérifie si on est en fin de séquence
procedure finDeSequence () is
	
	begin

end finDeSequence;

procedure insertionPoly (APoly: in out type_projet.AccEns_Poly; Pos: in integer; zMin: in float) is 

begin
	
	
end insertionPoly;

end tri_paquets;