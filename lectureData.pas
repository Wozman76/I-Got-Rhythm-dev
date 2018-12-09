program LectureData;
uses IGRTypes, sysutils;

var fichier : File of Touche;
	tab : TabMusic;
	i : Word;
BEGIN
assign(fichier, 'creativeminds.song');
reset(fichier);
i := 0;

while not(eof(fichier)) do;
begin
	i := i + 1;
	read(fichier, tab[i]);
	writeln(tab[i].key);
	writeln(tab[i].temps);
end;

close(fichier);

END.
