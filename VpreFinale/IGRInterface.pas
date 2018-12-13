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
uses sdl, sdl_mixer_nosmpeg, crt, sysutils, keyboard, IGRTypes, IGRSon;

procedure startScreen();
procedure menu(var choixMenu : Word; player : Joueur);
procedure difficulte(var niveau : Word; player : Joueur);
procedure choixMusique(niveau : Word ; var musique : String);
procedure joueur(var player : Joueur);
procedure afficherInterface();
procedure nouvellePartie(var finPartie : Boolean; player : Joueur);
procedure compteRebour();
procedure credits(var sound : pMIX_MUSIC);


Implementation


procedure startScreen();
var x, y : Word;
begin

	x := 36;
	y := 8;
	
	clrscr;
	
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
	writeln;
	writeln('Appuyez sur [ESPACE] pour continuer...');
	
	while GetKeyEventCode(GetKeyEvent()) <> 14624 do
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
var y, j : Word;
	k : TKeyEvent;
	tab : MenuDiffTab;
begin

	y := 5;
	tab[1] := 'Jouer';
	tab[2] := 'Highscores';
	tab[3] := 'Crédits';
	
	clrscr;
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln('Bonjour ' + player.nom + ' ! Que voulez-vous faire ?');
	writeln;
	TextBackground(White);
	TextColor(Black);
	writeln('- ' + tab[1]);
	TextBackground(Black);
	TextColor(LightGray);
	writeln('- ' + tab[2]);
	writeln('- ' + tab[3]);
	
	
	repeat 
	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			18432 : if (y > 5) then	y := y - 1;		
			20480 : if (y < 7) then y := y + 1;
		end;
		
		
		GotoXY(1,5);
			for j := 1 to 3 do
				if j = y - 4 then
					begin
						TextBackground(White);
						TextColor(Black);
						writeln('- ' + tab[j]);
						TextBackground(Black);
						TextColor(LightGray);
						
	
					end
				else writeln('- ' + tab[j]);
	
		
	until GetKeyEventCode(k) = 7181; 
	
	choixMenu := y - 4;




end;





{choix de la difficultée}
procedure difficulte(var niveau : Word; player : Joueur);
var y, j : Word;
	k : TKeyEvent;
	tab : MenuDiffTab;
begin

	niveau := 0;
	y := 5;
	tab[1] := 'facile';
	tab[2] := 'moyen';
	tab[3] := 'difficile';
	
	
	clrscr;
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln ('Quelle difficulté voulez-vous?');
	writeln;
	TextBackground(White);
	TextColor(Black);
	writeln('- ' + tab[1]);
	TextBackground(Black);
	TextColor(LightGray);
	writeln('- ' + tab[2]);
	writeln('- ' + tab[3]);
	
	
	repeat	
	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			18432 : if (y > 5) then	y := y - 1;		
			20480 : if (y < 7) then y := y + 1;
		end;
		
		
	GotoXY(1,5);
		for j := 1 to 3 do
			if j = y - 4 then
				begin
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + tab[j]);
					TextBackground(Black);
					TextColor(LightGray);
					

				end
			else writeln('- ' + tab[j]);
		
		
	until GetKeyEventCode(k) = 7181; 
	
	niveau := y - 4;
	
end;


{choix de la musique en fonction de la difficultée}
procedure choixMusique(niveau : Word ; var musique : String);
var ficMusniv : Text;
	i, j, y : Word;
	tab : TabListMusique;
	k : TKeyEvent;
begin
	
	clrscr;
	
	i := 0;
	y := 5;
	
	case niveau of 
		1 : assign(ficMusniv, 'listes/listeFacile.txt');
		2 : assign(ficMusniv, 'listes/listeMoyen.txt');
		3 : assign(ficMusniv, 'listes/listeDifficile.txt');
	end;
	


	reset(ficMusniv);
	writeln('------------------------------ I Got Rhythm -------------------------------');
	writeln;
	writeln('Quelle musique voulez-vous?');
	writeln;
	while not (eof(ficMusniv)) do
		begin
			i := i + 1;
			readln(ficMusniv, tab[i]);
			if i = 1 then
				begin
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + tab[1]);
					TextBackground(Black);
					TextColor(LightGray);
					

				end
			else writeln('- ' + tab[i]);
		end;
	close(ficMusniv);
	
	
	
	repeat	
	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			18432 : if (y > 5) then	y := y - 1;		
			20480 : if (y < i + 4) then y := y + 1;
		end;
		
		GotoXY(1,5);
		for j := 1 to i do
			if j = y - 4 then
				begin
					TextBackground(White);
					TextColor(Black);
					writeln('- ' + tab[j]);
					TextBackground(Black);
					TextColor(LightGray);
					

				end
			else writeln('- ' + tab[j]);
		
		
		
	until GetKeyEventCode(k) = 7181; 
	
	musique := tab[y - 4];
		

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
var choixFin : Boolean;
	k : TKeyEvent;
begin
	choixFin := False;
	writeln;
	writeln;
	writeln('Voulez-vous rejouer? o (oui) / n (non)');
	
	
	repeat
	
		k := GetKeyEvent;
		case GetKeyEventCode(k) of
			6255 :	begin
						finPartie := False;
						choixFin := True;
					end;
					
			12654 :	begin
						finPartie := True;
						choixFin := True;
					end;
		else writeln('Mauvaise touche...');
		end;
		
	until choixFin;
	
	if finPartie then
		begin
			writeln;
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



procedure credits(var sound : pMIX_MUSIC);
var fichier : Text;
	tab : TabCredit;
	i, j, k : Word;
	arret : Boolean;
begin

	i := 1;
	j := 1;
	
	stopSon(sound);
	son(sound, 'Theme');
	
	arret := False;
	assign(fichier, 'credits.txt');
	

	reset(fichier);
	
	while not(eof(fichier)) do
		begin
			readln(fichier, tab[i]);
			i := i + 1;
		end;
	
	close(fichier);
	
	
	repeat 
	
		clrscr;
		GotoXY(1,1);
		writeln('------------------------------ I Got Rhythm -------------------------------');
		GotoXY(1,3);
		
		for k := j to j + 20 do
			begin
			if tab[k] = 'FIN' then
				begin
					arret := True;
					break;
				end
			else writeln(tab[k]);
			end;
	
		sleep(300);
		j := j + 1;
	
	
	
	
	until arret;
	
	sleep(3000);
	
	
	end;



END.
