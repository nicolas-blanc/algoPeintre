-- Erreur ligne 54 --> Antoine

package body tri_paquets is

--Procedure effectuant un tri par paquet.
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

--Effectue une insertion triée dans une liste.
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

--Place sur le premier polygone du tableau de liste de polygone.
procedure demarrer (APoly: in AccEns_Poly; Pp: in out AListePoly; CaseCour : out integer) is 
	i: integer:=0;
	trouve:boolean;
begin
	if APoly.all'length > 1 then
		trouve:=False;
		Pp:= APoly(i);
		while not(trouve) and i<=APoly.all'length loop
			if Pp /= null then
				trouve:=True;
			else
				i:=i+1;
				Pp:=APoly(i);
			end if;
		end loop;
		CaseCour:=i;
	else
		CaseCour := -1;
		Pp := null;
	end if;
end demarrer;

--Renvoi les infos sur l'element en cours
function elemCourant(Pp: in AListePoly) return AccPointsFace is
--pFacesTemp : AccPointsFace;
	begin
		return Pp.all.p_poly;
end elemCourant;

--Fait avancer de 1 polygone.
procedure avancer (APoly: in AccEns_Poly; Pp: in out AListePoly; CaseCour: in out integer) is
begin
	if Pp.all.Succ /= null then
		Pp:=Pp.all.Succ;
	else 
		CaseCour:=CaseCour+1;
		while CaseCour < APoly.all'length and then APoly(CaseCour) = null loop
			CaseCour:=CaseCour+1;
		end loop;
		if CaseCour < APoly.all'length then
		Pp:=APoly(CaseCour);
		end if;
	end if;

end avancer;

--Vérifie si on a terminé le parcours du tableau de liste de polygones.
function finDeSequence (APoly: in AccEns_Poly; CaseCour: in integer) return boolean is
begin
	return CaseCour = APoly.all'length;
end finDeSequence;

end tri_paquets;