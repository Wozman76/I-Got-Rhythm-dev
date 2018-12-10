unit IGRInterface;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


Interface
uses crt, sysutils, keyboard, IGRTypes;

procedure startScreen();
procedure difficulte(var niveau : Word; player : Joueur);
procedure choixMusique(niveau : Word ; var musique : String);
procedure joueur(var player : Joueur);
procedure afficherInterface();
procedure nouvellePartie(var again : Boolean; player : Joueur);
procedure compteRebour();


Implementation


procedure startScreen();
var x, y : Word;
begin
	x := 36;
	y := 8;
	
	GotoXY(x, y + 1);
	writeln('    ____');
	GotoXY(x, y + 2);
	writeln('   /  _/');
	GotoXY(x, y + 3);
	writeln('   / /  ');
	GotoXY(x, y + 4);
	writeln(' _/ /   ');
	GotoXY(x, y + 5);
	writeln('/___/   ');
	
	sleep(700);
	clrscr;
	sleep(500);
	
	x := 30;

	GotoXY(x, y + 1);
	writeln('   ______      __ ');
	GotoXY(x, y + 2);
	writeln('  / ________  / /_');
	GotoXY(x, y + 3);
	writeln(' / / __/ __ \/ __/');
	GotoXY(x, y + 4);
	writeln('/ /_/ / /_/ / /_  ');
	GotoXY(x, y + 5);
	writeln('\____/\____/\__/  ');
	
	sleep(700);
	clrscr;
	sleep(500);
	
	x := 18;

	
	GotoXY(x, y + 1);
	writeln('    ____  __          __  __            ');
	GotoXY(x, y + 2);
	writeln('   / __ \/ /_  __  __/ /_/ /_  ____ ___ ');
	GotoXY(x, y + 3);
	writeln('  / /_/ / __ \/ / / / __/ __ \/ __ `__ \');
	GotoXY(x, y + 4);
	writeln(' / _, _/ / / / /_/ / /_/ / / / / / / / /');
	GotoXY(x, y + 5);
	writeln('/_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ ');
	GotoXY(x, y + 6);
	writeln('            /____/                      ');
	
	
	
	sleep(700);
	clrscr;
	sleep(500);
	
	
	x := 8;

	
	GotoXY(x, y + 1);
	writeln('    ____   ______      __     ____  __          __  __            ');
	GotoXY(x, y + 2);
	writeln('   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ ');
	GotoXY(x, y + 3);
	writeln('   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \');
	GotoXY(x, y + 4);
	writeln(' _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /');
	GotoXY(x, y + 5);
	writeln('/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ ');
	GotoXY(x, y + 6);
	writeln('                                      /____/                      ');
	
	sleep(2000);
	
	writeln;
	writeln('Appuyez sur [ESPACE] pour continuer...');
	
	while GetKeyEventChar(TranslateKeyEvent(GetKeyEvent())) <> ' ' do
		sleep(10);

	clrscr;

end; 



{nom utilisateur}
procedure joueur (var player : Joueur);
begin
	writeln('Quel est votre nom?');
	readln(player.nom);
	clrscr;
end;


{choix de la difficultée}
procedure difficulte(var niveau : Word; player : Joueur);
begin
	niveau := 0;
	writeln('Bonjour ' + player.nom + ' !');
	Repeat
		writeln ('Quelle difficulté voulez-vous?');
		writeln;
		writeln('1 (facile), 2 (moyen) ou 3 (difficile)');
		readln (niveau);
	until (niveau = 1) or (niveau = 2) or (niveau = 3);
	clrscr;
end;


{choix de la musique en fonction de la difficultée}
procedure choixMusique(niveau : Word ; var musique : String);
var ficMusniv : Text;
	mus : String;
	i : Word;
	choix : Boolean;

begin
	i := 0;
	choix := False;
	case niveau of 
		1 : assign(ficMusniv, 'listeFacile.txt');
		2 : assign(ficMusniv, 'listeMedium.txt');
		3 : assign(ficMusniv, 'listeDifficile.txt');
	end;

	reset(ficMusniv);
	writeln('Quelle musique voulez-vous?');
	while not (eof(ficMusniv)) do
		begin
			i := i + 1;
			readln(ficMusniv, mus); 
			writeln('- ',i, ' ' + mus);
		end;
	close(ficMusniv);
	
	
	Repeat
		readln(musique);
		reset(ficMusniv);
		while not (eof(ficMusniv)) do
			begin	
				readln(ficMusniv, mus);
				if (musique = mus) then
					choix := true;
				
			end;
		if not(choix) then
			writeln('Je n''ai pas compris... Quelle musique voulez-vous?');
		close(ficMusniv);
	until (choix = true);
	writeln('vous avez choisi la musique ', musique);


	sleep(2000);
	clrscr;
	
	
	
	

end;




{affiche grille de jeu}
procedure afficherInterface();
var i : Word;
begin
	for i := 1 to 17 do
		begin
			GotoXY(28,i);
			write('|   |   |   |   |   |');
	
		end;
		

	
	
	GotoXY(1,18);
	write('--------------------------------------------------------------------------------');

	GotoXY(28, 19);
	write('| C | V | B | N | ? |');


end;


procedure nouvellePartie(var again : Boolean; player : Joueur);
var ouiNon : Char;
begin
writeln('Voulez-vous rejouer? o (oui) / n (non)');
repeat
readln(ouiNon);
case ouiNon of 
	'o' : again := True;
	'n' : again := False;
else writeln('Je n''ai pas compris...');
end;

until (ouiNon = 'o') or (ouiNon = 'n');

if not(again) then
	begin
		writeln('Au revoir, ' + player.nom);
	end;


end;

procedure compteRebour();
var i, x, y : Word;
begin
	x := 38;
	y := 12;
	sleep(1000);
	for i := 3 downto 1 do
		begin
			GotoXY(x,y);
			write(i);
			sleep(1000);
			GotoXY(x,y);
			write(' ');
		end;
	GotoXY(1,1);

end;



END.
