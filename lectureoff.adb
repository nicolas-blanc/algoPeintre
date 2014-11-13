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

procedure initEnsPoints (nbs: in integer; f: in file_type; EPoints: out type_projet.Ens_points; max, min : in out float) is
	p:type_projet.point;
begin
	Get(f,p.y);
	Get(f,p.z);
	Get(f,p.x);
	EPoints(0):=p;

	max := p.z;
	min := p.z;

	for i in 1..nbs loop
		Get(f,p.x);
		Get(f,p.y);
		Get(f,p.z);
		EPoints(i):=p;
		if p.z < min then
			min := p.z;
		elsif p.z > max then
			max := p.z;
		end if;
	end loop;
end initEnsPoints;

procedure initEnsPolygones (nbf: in integer; f: in file_type; p: out type_projet.AccEns_Poly) is
	t : integer;
	d : integer;
begin
	p := new type_projet.Ens_Poly(0..nbf);
	for i in 0..nbf loop
		Get(f,t);
		declare
			faceTemp: type_projet.pointsFace(0..t-1);
		begin
			for j in 0..(t-1) loop
				tri_paquets.tripaquet(faceTemp,p);
				d := 1;
			end loop;
		end;
	end loop;
end initEnsPolygones;

end lectureoff;