with type_projet;
package body tri_paquets is

procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer) is
	indice : integer;
begin
	indice := Float'Floor(min + nbf * ((minZ - min) / (max - min)));
	insertionPoly(p_poly,pF,minZ,nbf);
end triPaquet;

procedure insertionTabPoly (p_poly: in type_projet.AccEns_Poly; pF : in type_projet.pointsFace; minZ: in float; indice : in integer) is 
begin
	insertionListPoly(p_poly.all(indice),pF,meinZ);
end insertionTabPoly;

procedure insertionListPoly (list : in out type_projet.ListPoly; pF : in type_projet.pointsFace; minZ : in float) is
	p : type_projet.AListePoly;
	l : type_projet.ListPoly := list;
	lpred : type_projet.ListPoly := list;
begin -- insertionListPoly
	while l != null and then minZ < l.all.minZ loop
		lpred := l;
		l := l.all.succ;
	end loop;

	if l = null then
	else
		lpred.all.succ := insereTete(l,pF,minZ);
	end if;
end insertionListPoly;

function insereTete(list : in out type_projet.ListPoly) return  is
	
begin -- insereTete(list : in out type_projet.ListPoly)
	
end insereTete(list : in out type_projet.ListPoly);

--Place sur le premier triangleZ
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
	

end tri_paquets;