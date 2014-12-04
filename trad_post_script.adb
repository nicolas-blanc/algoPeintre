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
p_list: AListePoly;
k:integer:=0;
begin
	for i in APoly.all'range loop 
			p_list:=APoly(i);
			k:=0;
			Put_Line(Integer'Image(i));
			while p_list /=null loop
				Put_Line("     "&Integer'Image(k));
				if p_list.all.p_poly /= null then
					--for j in p_list.all.p_poly.all'range loop
						--Put_Line(Integer'image((APoly.all(i).all.p_poly.all)'length));
						--Put_Line(Integer'Image(j)&);
					--end loop;
					Put_Line("          "&Float'Image(p_list.all.minZ));
				end if;
				p_list:=p_list.all.Succ;
				k:=k+1;
			end loop;
	end loop;

end afficherTab;

procedure afficherPostScript(nom_fichier : in string; APoly: in type_projet.AccEns_Poly;EPoints : in Ens_points; minx,maxx,miny,maxy,minz,maxz: in float) is
p_list: AListePoly;
k:integer:=0;
transx:float:=0.0;
transy:float:=0.0;
ratio,ratiox,ratioy:float:=0.0;

Apface : AccPointsFace;
fichierPost: file_type;
begin

	create(fichierPost,Out_File,nom_fichier);
	Put_Line(fichierPost,"%!PS");
	Put_Line(fichierPost,"0 setlinewidth");

	if minx < 0.0 then transx:=-minx; end if;
	if miny < 0.0 then transy:=-miny; end if;

	--ratiox:= (maxx + transx) /590.0;
	--ratioy:=(maxy + transy) /840.0;
	ratiox:= 590.0/((maxx+ transx) - (minx+transx));
	ratioy:= 840.0/((maxy+ transy) - (miny+transy));

	if ratiox > ratioy then ratio:=ratioy;
	else ratio:=ratiox; 
	end if;
	Put_Line("transx" & Float'Image(transx));
	Put_Line("calc1" & Float'Image((maxx+ transx) - (minx-transx)));

	Put_Line("transy" & Float'Image(transy));
	Put_Line("Ratio" & Float'Image(ratio));
	Put_Line("Ratiox" & Float'Image(ratiox));
	Put_Line("Ratioy" & Float'Image(ratioy));

	for i in APoly.all'range loop 
			p_list:=APoly(i);
			k:=0;
			while p_list /=null loop
				if p_list.all.p_poly /= null then
				Apface:=p_list.all.p_poly;
					for j in Apface'range loop
						if (j=0) then Put_Line(fichierPost,Float'Image(((EPoints(Apface.all(j)).x) + transx)
						 * ratio)
						  & " "
						  & Float'Image(((EPoints(Apface.all(j)).y)+transy) * ratio) 
						& " moveto");
						else Put_Line(fichierPost,Float'Image(((EPoints(Apface.all(j)).x) + transx) * ratio) 
							& " " & Float'Image(((EPoints(Apface.all(j)).y)+transy) * ratio)
							& " lineto");
						end if;
						if (j=Apface'last) then Put_Line(fichierPost,Float'Image(((EPoints(Apface.all(0)).x) + transx) * ratio)
						 & " " & Float'Image(((EPoints(Apface.all(0)).y)+transy) * ratio)
						 & " lineto"); end if;
					end loop;
						Put_Line(fichierPost,"gsave");
						Put_Line(fichierPost,"1 setgray");
						Put_Line(fichierPost,"fill");
						Put_Line(fichierPost,"grestore");
						Put_Line(fichierPost,"0 setgray");
						Put_Line(fichierPost,"stroke");
					end if;
					p_list:=p_list.all.Succ;
					k:=k+1;
				end loop;
	end loop;

	Put_Line(fichierPost,"showpage");

end afficherPostScript;

end trad_post_script;