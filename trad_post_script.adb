with tri_paquets;

package body trad_post_script is 

procedure trad(nom_fichier : in string; APoly: in AccEns_Poly; EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float) is
CaseCour: integer:=0;
fichierPost: file_type;

Ptemp: AListePoly;
Etemp: AccPointsFace;

transx,transy,trans: float:=0.0;

begin

	if minx <0.0 then transx := -minx; end if;
	if miny <0.0 then transy := -miny; end if;

	create(fichierPost,Out_File,nom_fichier & ".txt");
	Put_Line(fichierPost,"%!PS");

	Ptemp:=APoly.all(0);


	tri_paquets.demarrer(APoly,Ptemp,CaseCour);
	--if Ptemp = null then Put_Line("j'suis apres demarrer, Ptemp est nulle -_-");end if;

	while (Ptemp /= null) loop
		Etemp:=tri_paquets.elemCourant(Ptemp);
		for i in Etemp.all'range loop
			Put_Line("J'suis en i=" & Integer'Image(i));
			if (i=0) then 
							Put(fichierPost,Float'Image(EPoints(Etemp.all(i)).x + 20.0));--Aller chercher le point dans le tabelau
							Put(fichierPost," ");
							Put(fichierPost,Float'Image(EPoints(Etemp.all(i)).y + 20.0));
						    Put_Line(fichierPost," moveto");
			end if; 

			Put(fichierPost,Float'Image(EPoints(Etemp.all(i)).x + 20.0));
			Put(fichierPost," ");
			Put(fichierPost,Float'Image(EPoints(Etemp.all(i)).y + 20.0));
			Put_Line(fichierPost," lineto");

		end loop;

		tri_paquets.avancer(APoly,Ptemp,CaseCour);

	end loop;

	Put_Line(fichierPost,"gsave");
	Put_Line(fichierPost,"1 setgray");
	Put_Line(fichierPost,"fill");
	Put_Line(fichierPost,"grestore");
	Put_Line(fichierPost,"0 setgray");
	Put_Line(fichierPost,"stroke");


end trad;

procedure afficherTab(APoly: in type_projet.AccEns_Poly) is
	p_list : AListePoly;
	k : integer := 0;
begin
	for i in APoly.all'range loop
		Put_Line(Integer'Image(i));
		p_list := APoly(i);
		k := 0;
		while p_list /= null loop
			Put_Line("     " & Integer'Image(k));
			if p_list.all.p_poly /= null then
				for j in p_list.all.p_poly.all'range loop
					Put_Line("          " & Integer'image(j));
				end loop;
			end if;
			p_list := p_list.all.Succ;
			k := k + 1;
		end loop;
	end loop;

end afficherTab;

end trad_post_script;