package body lectureoff is

--Procedure initialisant le nombre de points et de polygnes que contient le fichier.
--Necessaire pour l'initialisation des autres srucutres de données.
procedure init (monFichier: out file_type; nom : in string; DBase : out type_projet.DonBase) is
	s1 : string(1..3);
begin
	open(monFichier,In_File,nom);
	Get(monFichier,s1);
	if s1 = "OFF" then
		Get(monFichier,DBase(0));
		Get(monFichier,DBase(1));
		Get(monFichier,DBase(2));
	end if;
end init;

procedure close (f : in out file_type) is
begin
	Ada.Text_IO.close(f);
end close;

--Procedure remplissant le tableau de points en les lisant dans le fichier.
--Créer un point differement selon le type de vue choisie.
procedure initEnsPoints (vue, nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; maxx,minx,maxy,miny,maxz,minz : in out float) is
	p:type_projet.point;

	--Lit les trois coordonnées d'un point.
	procedure lirePoint (f: in file_type; p1, p2, p3 : in out float) is
	begin -- lirePoint
		Get(f,p1);
		Get(f,p2);
		Get(f,p3);		
	end lirePoint;
begin
	--Remplit le point differemet selon la vue souhaitée.
	if vue = 1 then
		lirePoint(f,p.z,p.y,p.x);
	elsif vue = 2 then
		lirePoint(f,p.x,p.z,p.y);
	else
		lirePoint(f,p.x,p.y,p.z);
	end if;
	EPoints(0):=p;
	-- Put_Line("J'ai x=" & Float'Image(EPoints(0).x));

	maxz := p.z;
	minz := p.z;
	maxx := p.x;
	minx := p.x;
	miny := p.y;
	maxy := p.y;

	for i in 1..nbs-1 loop

		if vue = 1 then
			lirePoint(f,p.z,p.y,p.x);
		elsif vue = 2 then
			lirePoint(f,p.x,p.z,p.y);
		else
			lirePoint(f,p.x,p.y,p.z);
		end if;
		EPoints(i) := p;

--Calcul des maximum et minimum pour chaque coordonnées.
		if p.z < minz then
			minz := p.z;
		elsif p.z > maxz then
			maxz := p.z;
		end if;

		if p.x < minx then
			minx := p.x;
		elsif p.x > maxx then
		 	maxx := p.x;
		end if;

		if p.y < miny then 
			miny := p.y;
		elsif p.y > maxy then
			maxy:=p.y;
		end if;

	end loop;

exception
	when ADA.IO_EXCEPTIONS.END_ERROR => Put_Line("Le fichier est vide");
end initEnsPoints;

--Procedure lisant l'ensemble des polygones.
--Remplit le tableau de liste de polygones.
procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float) is
	t : integer;
	d : integer;
	minZ : float;
begin
	p_poly := new type_projet.Ens_Poly(0..nbf);
	for i in 0..(nbf-1) loop
		Get(f,t);
		declare
			faceTemp: type_projet.pointsFace(0..t-1);
		begin
			for j in 0..(t-1) loop
				Get(f,d);
				faceTemp(j) := d;
				if j = 0 then
					minZ := EPoints(d).z;
				elsif EPoints(d).z < minZ then
					minZ := EPoints(d).z;
				end if;
			end loop;
			tri_paquets.tripaquet(faceTemp,p_poly,minZ,min,max,nbf);
		end;
	end loop;
exception
	when ADA.IO_EXCEPTIONS.END_ERROR => Put_Line("Erreur sur le nombre de ligne du fichier");
		raise NBR_LIGNES_ERROR;
	when others => raise;
end initEnsPolygones;

end lectureoff;