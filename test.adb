with type_projet;
use type_projet;
with lectureoff;
use lectureoff;

procedure test is
p1,p2,p3: point;
t1:triangle;

begin
p1:= point'
	(x => 1,
	 y => 2,
	 z => 3);

p2 := point'
	(x => 3,
	 y => 4,
	 z => 5);
p3 := point'
	(x => 6,
	 y => 7,
	 z => 8);
	
t1 := triangle'
	(s1 => 1,
	s2 => 2,
	s3 => 3);

lectureFichierOFF("test.txt");

end test;