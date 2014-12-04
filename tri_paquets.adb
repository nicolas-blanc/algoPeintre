-- Erreur ligne 54 --> Antoine

package body tri_paquets is

procedure triPaquet (pF : in pointsFace; p_poly : in AccEns_Poly; minZ, min, max : in float; nbf : in integer) is
	indice : integer;
begin
	indice := abs(Integer(Float'Floor(min + float(nbf) * ((minZ - min) / (max - min))))); --Invalide Integer * Float --> recuperer int to float
	insertionTabPoly(p_poly,pF,minZ,indice);

	--Calcul d'indice de rémi
	--wIndex_courant := Integer(Float'Floor(Float(aNbFormes) * ((getMinZForme(wCourant.all.F, aSommets) - aMinZ) / (aMaxZ-aMinZ))));
exception
	when NEGATIF_ERROR => Put_Line("Indice "&Integer'Image(indice));
			Put_Line("min "&Float'Image(min));Put_Line("nbf "&Integer'Image(nbf));
			Put_Line("minZ"&Float'Image(minZ));Put_Line("max "&Float'Image(max));
			raise NEGATIF_ERROR;
	when others => raise;
end triPaquet;

procedure insertionTabPoly (p_poly: in AccEns_Poly; pF : in pointsFace; minZ: in float; indice : in integer) is 
test:integer:=0;
begin

	--Put_Line("J'suis dans inserTabPoly");
	--if p_poly = null then Put_Line("p_poly est nulle!!!!");
	--else Put_Line("p_poly pas nul"); end if; 

	--test:=p_poly.all'length;
	--Put_Line(Integer'Image(test));
	--Put_Line(Integer'Image(indice));

	--if p_poly.all(indice) = null then Put_Line("p_poly.all(indice) est nulle!!!!");
	--else Put_Line("p_poly.all(indice) pas nul"); end if; 

	insertionListPoly(p_poly.all(indice),pF,minZ);

exception
	when CONSTRAINT_ERROR => Put_Line("Erreur sur le tableau dans insertionTabPoly");
			raise NEGATIF_ERROR;
	when others => raise;
end insertionTabPoly;

procedure insertionListPoly (list : in out AListePoly; pF : in pointsFace; minZ : in float) is
	p : AListePoly;
	pTemp:ListePoly;
	l : AListePoly := list;
	lpred : AListePoly := list;
	ptest:AccPointsFace;
begin -- insertionListPoly
	while (l /= null) and then (minZ > l.all.minZ) loop
	--Put_Line("loop \o/");
		lpred := l;
		l := l.all.Succ;
	end loop;

	ptest:= new pointsFace(0..pF'length-1);
	ptest.all:=pF;
	pTemp.p_poly:=ptest;
	pTemp.minZ:=minZ;
	pTemp.Succ:=null;

	--Put_Line("On tente l'accès à l");
	--Put_Line(Float'Image(l.all.minZ));

	--Put_Line("On tente l'accès à lpred");
	--Put_Line(Float'Image(lpred.all.minZ));
	--Put_Line("On va tenter l'insereTete");
	
	--lpred.all.Succ := insereTete(lpred.all.Succ,pF,minZ);
	insereTete(lpred,pTemp);
	list:=lpred;
	exception
	when others => Put_Line("Erreur dans insertionListPoly");
			raise ERROR;
end insertionListPoly;

--function insereTete (list : in AListePoly; pF : in pointsFace; minZ : in float) return AListePoly is
--	p : AListePoly;
--	f : ListePoly;
--	ptest: AccPointsFace;
--begin -- insereTete
--	Put_Line("J'suis dans l'insereTete");
--	ptest := new PointsFace(0..pF'length);
--	Put_Line("Init PointsFace");
--	ptest.all := pF;
--	Put_Line("ptest assigné");

--	f.p_poly := ptest;
--	f.minZ := minZ;
--	f.Succ := list;
--	Put_Line("f est rempli");

--	p := new ListePoly;
--	Put_Line("p créé");
--	p.all := f;
--	Put_Line("p assigné");

--	return p;
--end insereTete;

procedure insereTete (list: in out AListePoly; elem: in ListePoly) is
	
	pTemp:AListePoly;
	
	begin
		--Put_Line(Float'Image(elem.minZ));
		pTemp:= new ListePoly;
		pTemp.all:=elem;
		pTemp.all.Succ:=list;
		list:=pTemp;

end insereTete;

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