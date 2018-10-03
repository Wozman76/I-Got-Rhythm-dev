program MusicData;

uses IGRTypes;



var t : Touche;
	fichier : file of Touche;
	tab, tab2 : TabMusic;
	i : Word;




BEGIN

	for i := 1 to 10 do
		begin
			writeln('touche');
			readln(tab[i].key);
			writeln('temps');
			readln(tab[i].temps);
			writeln('posX');
			readln(tab[i].posX);
		end;


	assign(fichier, 'song1.song');
	rewrite(fichier);
	for i := 1 to 10 do
		write(fichier, tab[i]);
	close(fichier);
	
	
	reset(fichier);
	
	for i := 1 to 10 do
		read(fichier, tab2[i]);
		
	for i := 1 to 10 do
		begin
			writeln(tab[i].key);
			writeln(tab2[i].temps);
			writeln(tab2[i].posX);
			writeln;
		end;
		
	close(fichier);
	
	



END.
