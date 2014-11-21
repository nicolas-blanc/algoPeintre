with type_projet;

-- Erreur ligne 54 --> Antoine

package body tri_paquets is

procedure triPaquet (pF : in type_projet.pointsFace; p_poly : in type_projet.AccEns_Poly; minZ, min, max : in float; nbf : in integer) is
	indice : integer;
begin
	-- indice := Float'Floor(min + nbf * ((minZ - min) / (max - min))); Invalide Integer * Float --> recuperer int to float
	insertionTabPoly(p_poly,pF,minZ,nbf);
end triPaquet;

procedure insertionTabPoly (p_poly: in type_projet.AccEns_Poly; pF : in type_projet.pointsFace; minZ: in float; indice : in integer) is 
begin
	insertionListPoly(p_poly.all(indice),pF,minZ);
end insertionTabPoly;

procedure insertionListPoly (list : in out type_projet.AListePoly; pF : in type_projet.pointsFace; minZ : in float) is
	p : type_projet.AListePoly;
	l : type_projet.AListePoly := list;
	lpred : type_projet.AListePoly := list;
begin -- insertionListPoly
	while l /= null and then minZ < l.all.minZ loop
		lpred := l;
		l := l.all.succ;
	end loop;

	lpred.all.succ := insereTete(l,pF,minZ);
end insertionListPoly;

function insereTete (list : in type_projet.AListePoly; pF : in type_projet.pointsFace; minZ : in float) return type_projet.AListePoly is
	p : type_projet.AListePoly;
	f : type_projet.ListePoly;
begin -- insereTete
	p := new type_projet.AccPointsFace;
	p.all := pF;
	f.p_poly := p;
	f.minZ := minZ;
	f.Succ := list;

	p := new type_projet.AListePoly;
	p.all := f;

	return p;
end insereTete;

--Place sur le premier triangleZ
procedure demarrer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour : out integer) is 
	Ptab: type_projet.AccEns_Poly;
	i: integer:=0;
begin
	Ptab:=APoly;
	if (Ptab /= null) then 
		Pp:= Ptab.all(i);
		i:=i+1;
		if (Pp = null) then
			while (i < 0 and Pp = null) loop -- Erreur ici, a voir si c'est 0 ?
				Pp:=Ptab.all(i);
				i:= i+1;	
		end loop;
		end if;
		CaseCour:=i;
	end if;
end demarrer;

--Renvoi les infos sur l'elem en cours
function elemCourant(Pp: in type_projet.AListePoly) return type_projet.AccPointsFace is
pFacesTemp : type_projet.pointsFace;
	begin
		return Pp.all.p_poly;
end elemCourant;
--Fait avancer de 1 element
procedure avancer (APoly: in type_projet.AccEns_Poly; Pp: in out type_projet.AListePoly; CaseCour: in out integer) is

	begin
		if (Pp.all.succ /= null) then 
			Pp:= Pp.all.succ;
		else 
			while (APoly.all(CaseCour+1) /= null) loop
				CaseCour:=CaseCour+1;
			end loop;
			Pp:= APoly.all(CaseCour);
		end if;
end avancer;

--Vérifie si on est en fin de séquence
--procedure finDeSequence is
	
--	begin

--end finDeSequence;
	

end tri_paquets;