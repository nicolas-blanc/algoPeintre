with tri_paquets;

package body trad_post_script is 

procedure trad(APoly: in AccEns_Poly; EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float) is
CaseCour: integer:=0;
fichierPost: file_type;

Ptemp: AListePoly;
Etemp: AccPointsFace;

transx,transy,trans: float:=0.0;

begin

	if minx <0.0 then transx := -minx; end if;
	if miny <0.0 then transy := -miny; end if;

	create(fichierPost,Out_File,"testPost.txt");
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
begin
	for i in APoly.all'range loop 
			if APoly.all(i) /= null then
			--else Put_Line("APoly pas nul");
			--end if;
		if APoly.all(i).all.p_poly /= null then
			for j in APoly.all(i).all.p_poly.all'range loop
				Put_Line(Integer'image(APoly.all(i).all.p_poly.all'range));
			end loop;
			end if;
		end if;
	end loop;

end afficherTab;

end trad_post_script;