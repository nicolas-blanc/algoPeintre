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
		EPoints(i) := p;
		if p.z < min then
			min := p.z;
		elsif p.z > max then
			max := p.z;
		end if;
	end loop;
end initEnsPoints;

procedure initEnsPolygones (nbf: in integer; f: in file_type; p_poly: out type_projet.AccEns_Poly; EPoints: in type_projet.Ens_points; min, max : in float) is
	t : integer;
	d : integer;
	minZ : float;
begin
	p_poly := new type_projet.Ens_Poly(0..nbf);
	for i in 0..nbf loop
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
end initEnsPolygones;

end lectureoff;