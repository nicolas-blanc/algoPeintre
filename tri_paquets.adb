-- Erreur ligne 54 --> Antoine

package body tri_paquets is

procedure triPaquet (pF : in pointsFace; p_poly : in AccEns_Poly; minZ, min, max : in float; nbf : in integer) is
	indice : integer;
	elem : ListePoly;
	p : AccPointsFace;
begin
	--Calcul d'indice de rémi
	--wIndex_courant := Integer(Float'Floor(Float(aNbFormes) * ((getMinZForme(wCourant.all.F, aSommets) - aMinZ) / (aMaxZ-aMinZ))));
	indice := Integer(Float'Floor(Float(nbf) * ((minZ - min) / (max-min))));
	--indice := abs(Integer(Float'Floor(float(nbf) * ((minZ - min) / (max - min))))); --Invalide Integer * Float --> recuperer int to float

	p := new pointsFace(0..pF'length-1);
	p.all := pF;
	elem.p_poly := p;
	elem.minZ := minZ;
	elem.Succ := null;

	insertGrowing(p_poly.all(indice),elem);

exception
	when INSERTION_ERROR => Put_Line("Indice "&Integer'Image(indice));
			Put_Line("min "&Float'Image(min));Put_Line("nbf "&Integer'Image(nbf));
			Put_Line("minZ"&Float'Image(minZ));Put_Line("max "&Float'Image(max));
			raise INSERTION_ERROR;
	when others => raise;
end triPaquet;

Procedure insertGrowing (l: in out AListePoly; elem: in ListePoly) is
	prec , p, p_elem : AListePoly;
begin
	p_elem := new ListePoly;
	p_elem.all := elem;
	p_elem.all.Succ := null;

	p := l;
	if p /= null then
		while p /= null and then p.all.minZ < elem.minZ loop
			prec := p;
			p := p.all.succ;
		end loop;
		
		if prec = null then
			p_elem.all.succ := l;
			l := p_elem;
		else
			prec.all.succ := p_elem;
			prec := prec.all.succ;
			prec.all.succ := p;
		end if;
	else
		l := p_elem;
		l.all.succ := null;
	end if;
end insertGrowing;

--Place sur le premier triangleZ
procedure demarrer (APoly: in AccEns_Poly; Pp: in out AListePoly; CaseCour : out integer) is 
	Ptab: AccEns_Poly;
	i: integer:=0;
begin
	Ptab:=APoly;

	--if Ptab = null then
	--Put_Line("j'suis dans demarrer, Ptab est nulle -_-");
	--else 
	--Put_Line("j'suis dans demarrer, Ptab est pas nulle \o/");
	--end if;

	if (Ptab /= null) then 
	--Put_Line("j'suis dans le if du demarrer");
		Pp:= Ptab.all(i); --if Pp = null then Put_Line("Pp est nulle"); end if;
		--i:=i+1;
		if (Pp = null) then
		--Put_Line("j'suis dans le 2eme if du demarrer");
			while (i < 5804 and Pp = null) loop -- Erreur ici, a voir si c'est 0 ?
				Pp:=Ptab.all(i);
				i:= i+1;	
		end loop;
		end if;
		CaseCour:=i;
	end if;
end demarrer;

--Renvoi les infos sur l'elem en cours
function elemCourant(Pp: in AListePoly) return AccPointsFace is
--pFacesTemp : AccPointsFace;
	begin
		return Pp.all.p_poly;
end elemCourant;
--Fait avancer de 1 element
procedure avancer (APoly: in AccEns_Poly; Pp: in out AListePoly; CaseCour: in out integer) is

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
--function finDeSequence (APoly: in AccEns_Poly; Pp: in AListePoly; CaseCour: in integer) is
--	
--	case:integer:=0;
--	begin
--
--	case:=CaseCour;
--	if (Pp.all.succ /= null) then 
--			Pp:= Pp.all.succ;
--		else 
--			while (APoly.all(case+1) /= null and case <= ) loop
--				case:=case+1;
--			end loop;
--		end if;

--end finDeSequence;

end tri_paquets;