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
procedure menu(var choixMenu : Word; player : Joueur);
procedure difficulte(var niveau : Word; player : Joueur);
procedure choixMusique(niveau : Word ; var musique : String);
procedure joueur(var player : Joueur);
procedure afficherInterface();
procedure nouvellePartie(var finPartie : Boolean; player : Joueur);
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

	

end; 



{nom utilisateur}
procedure joueur (var player : Joueur);
begin
	clrscr;
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln('Bonjour ! Quel est votre nom?');
	writeln;
	write('> ');
	readln(player.nom);

end;



procedure menu(var choixMenu : Word; player : Joueur);
var y : Word;
	k : TKeyEvent;
begin
clrscr;
writeln('------------------------------ I Got Rhythm -------------------------------');
writeln;
writeln('Bonjour ' + player.nom + ' ! Que voulez-vous faire ?');
writeln;
TextBackground(White);
TextColor(Black);
writeln('- Jouer');
TextBackground(Black);
TextColor(LightGray);
writeln('- Highscores');
writeln('- Crédits');

y := 5;
repeat 
	k := GetKeyEvent;
	case GetKeyEventCode(k) of
		18432 : if (y > 5) then	y := y - 1;		
		20480 : if (y < 7) then y := y + 1;
	end;
	
	case y of 
		5 : begin
				GotoXY(1,5);
				TextBackground(White);
				TextColor(Black);
				writeln('- Jouer');
				TextBackground(Black);
				TextColor(LightGray);
				writeln('- Highscores');
				writeln('- Crédits');
			end;
		6 : begin
				GotoXY(1,5);
				writeln('- Jouer');
				TextBackground(White);
				TextColor(Black);
				writeln('- Highscores');
				TextBackground(Black);
				TextColor(LightGray);
				writeln('- Crédits');
			end;
		7 : begin
				GotoXY(1,5);
				writeln('- Jouer');
				writeln('- Highscores');
				TextBackground(White);
				TextColor(Black);
				writeln('- Crédits');
				TextBackground(Black);
				TextColor(LightGray);
			end;
	end;
	
until GetKeyEventCode(k) = 7181; 

choixMenu := y - 4;




end;





{choix de la difficultée}
procedure difficulte(var niveau : Word; player : Joueur);
var y : Word;
	k : TKeyEvent;
begin
	niveau := 0;
	clrscr;
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln ('Quelle difficulté voulez-vous?');
	writeln;
	TextBackground(White);
	TextColor(Black);
	writeln('- facile');
	TextBackground(Black);
	TextColor(LightGray);
	writeln('- moyen');
	writeln('- difficile');
	
	y := 5;
	
	repeat	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			18432 : if (y > 5) then	y := y - 1;		
			20480 : if (y < 7) then y := y + 1;
		end;
		
		case y of 
			5 : begin
					GotoXY(1,5);
					TextBackground(White);
					TextColor(Black);
					writeln('- facile');
					TextBackground(Black);
					TextColor(LightGray);
					writeln('- moyen');
					writeln('- difficile');
				end;
			6 : begin
					GotoXY(1,5);
					writeln('- facile');
					TextBackground(White);
					TextColor(Black);
					writeln('- moyen');
					TextBackground(Black);
					TextColor(LightGray);
					writeln('- difficile');
				end;
			7 : begin
					GotoXY(1,5);
					writeln('- facile');
					writeln('- moyen');
					TextBackground(White);
					TextColor(Black);
					writeln('- difficile');
					TextBackground(Black);
					TextColor(LightGray);
				end;
		end;
		
	until GetKeyEventCode(k) = 7181; 
	
	niveau := y - 4;
	
end;


{choix de la musique en fonction de la difficultée}
procedure choixMusique(niveau : Word ; var musique : String);
var ficMusniv : Text;
	musTemp : String;
	i, y : Word;
	//choix : Boolean;
	musiqueListe : ListeMusique;
	k : TKeyEvent;

begin
	
	clrscr;
	
	i := 0;
	case niveau of 
		1 : assign(ficMusniv, 'listeFacile.txt');
		2 : assign(ficMusniv, 'listeMedium.txt');
		3 : assign(ficMusniv, 'listeDifficile.txt');
	end;
	reset(ficMusniv);
	musiqueListe.nbMusiques := 0;
	while not(eof(ficMusniv)) do
			begin
			readln(ficMusniv, musTemp);
			musiqueListe.nbMusiques := musiqueListe.nbMusiques + 1;
			end;
	close(ficMusniv);


	reset(ficMusniv);
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln('Quelle musique voulez-vous?');
	writeln;
	while not (eof(ficMusniv)) do
		begin
			i := i + 1;
			readln(ficMusniv, musiqueListe.tabListMus[i]);
			if i = 1 then
				begin
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + musiqueListe.tabListMus[1]);
					TextBackground(Black);
					TextColor(LightGray);
					

				end
			else writeln('- ' + musiqueListe.tabListMus[i]);
		end;
	close(ficMusniv);
	
	
	y := 5;
	
	repeat	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			18432 : if (y > 5) then	y := y - 1;		
			20480 : if (y < 7) then y := y + 1;
		end;
		
		case y of 
			5 : begin
					GotoXY(1,5);
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + musiqueListe.tabListMus[1]);
					TextBackground(Black);
					TextColor(LightGray);
					writeln('- ' + musiqueListe.tabListMus[2]);
					writeln('- ' + musiqueListe.tabListMus[3]);
				end;
			6 : begin
					GotoXY(1,5);
					writeln('- ' + musiqueListe.tabListMus[1]);
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + musiqueListe.tabListMus[2]);
					TextBackground(Black);
					TextColor(LightGray);
					writeln('- ' + musiqueListe.tabListMus[3]);
				end;
			7 : begin
					GotoXY(1,5);
					writeln('- ' + musiqueListe.tabListMus[1]);
					writeln('- ' + musiqueListe.tabListMus[2]);
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + musiqueListe.tabListMus[3]);
					TextBackground(Black);
					TextColor(LightGray);
				end;
		end;
		
	until GetKeyEventCode(k) = 7181; 
	
	musique := musiqueListe.tabListMus[y - 4];
		

	
	

	writeln;
	writeln;
	writeln('Vous avez choisi la musique ', musique);
	sleep(1000);
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


procedure nouvellePartie(var finPartie : Boolean; player : Joueur);
var ouiNon : Char;
begin
writeln('Voulez-vous rejouer? o (oui) / n (non)');
repeat
readln(ouiNon);
case ouiNon of 
	'o' : finPartie := False;
	'n' : finPartie := True;
else writeln('Je n''ai pas compris...');
end;

until (ouiNon = 'o') or (ouiNon = 'n');

if finPartie then
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
