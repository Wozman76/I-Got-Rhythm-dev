program MusicData;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses IGRTypes;

CONST MAX = 102;


 


var 
	fichier : file of Touche;
	tab, tab2 : TabMusic;
	i, touche : Word;
	toucheChar, newTouche : Char;




BEGIN

randomize;

toucheChar := ' ';
newTouche := ' ';
	for i := 1 to MAX do
		begin
			while newTouche = toucheChar do
				begin
					touche := random(5) + 1;
						case touche of 
							1 : newTouche := 'c';
							2 : newTouche := 'v';
							3 : newTouche := 'b';
							4 : newTouche := 'n';
							5 : newTouche := '?';
						end;
				end;
			toucheChar := newTouche;
			tab[i].key := toucheChar;
			writeln(i,' : temps pour ', toucheChar);
			readln(tab[i].temps);

		end;


	assign(fichier, 'creativemind.song');
	rewrite(fichier);
	for i := 1 to MAX do
		write(fichier, tab[i]);
	close(fichier);
	
	
	reset(fichier);
	
	for i := 1 to MAX do
		read(fichier, tab2[i]);
		
	for i := 1 to MAX do
		begin
			writeln(tab[i].key);
			writeln(tab2[i].temps);
			writeln;
		end;
		
	close(fichier);
	
	



END.
