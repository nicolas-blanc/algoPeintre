package body lectureoff is

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

procedure reopen(f:in out file_type;nom:in string)is
t1,t2,t3:integer:=0;
s1 : string(1..3);
begin
	open(f,In_File,nom);
	Get(f,s1);
	if s1 = "OFF" then
		Get(f,t1);
		Get(f,t2);
		Get(f,t3);
	end if;
end reopen;

procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; maxx,minx,maxy,miny,maxz,minz : in out float) is
	p:type_projet.point;
begin

	Get(f,p.x);
	Get(f,p.y);
	Get(f,p.z);
	EPoints(0):=p;
	--Put_Line("J'ai x=" & Float'Image(EPoints(0).x));

	maxz := p.z;
	minz := p.z;
	maxx := p.x;
	minx := p.x;
	miny := p.y;
	maxy := p.y;

	for i in 1..nbs-1 loop
	---Put_Line("J'suis en i=" & Integer'Image(i));
		Get(f,p.x);--Put_Line("J'ai x=" & Float'Image(p.x));
		Get(f,p.y);--Put_Line("J'ai y=" & Float'Image(p.y));
		Get(f,p.z);--Put_Line("J'ai z=" & Float'Image(p.z));
		EPoints(i) := p;

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
end initEnsPoints;

procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float) is
	t,test : integer;
	d : integer;
	minZ : float;
begin
	p_poly := new type_projet.Ens_Poly(0..nbf);
	for i in 0..(nbf-1) loop
		---Put_Line("J'suis en i=" & Integer'Image(i));--Va jusqu'a 5801 au lieu de 5804 mais est deja à la fin?! 
		Get(f,t);
		declare
			faceTemp: type_projet.pointsFace(0..t-1);
		begin
			for j in 0..(t-1) loop
				Get(f,d);
						--Put_Line("J'ai lu d=" & Integer'Image(d));
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
		raise type_projet.NBR_LIGNES;
end initEnsPolygones;

end lectureoff;