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

procedure startScreen();
procedure difficulte(var niveau : Integer);
procedure choixMusique(niveau : Integer ; var musique : String);
procedure nomUser (var nom : String);





Implementation
uses crt, sysutils, keyboard;

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


{choix de la difficultée}
procedure difficulte(var niveau : Integer);
begin
	niveau := 0;
	Repeat
		writeln ('quel difficulté voulez-vous? choissisez 1, 2 ou 3');
		readln (niveau);
	until (niveau = 1) or (niveau = 2) or (niveau = 3);
	writeln ('vous avez choisie le niveau ', niveau);
end;


{choix de la musique en fonction de la difficultée}
procedure choixMusique(niveau : Integer ; var musique : String);
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
	while not (eof(ficMusniv)) do
		begin
			i := i + 1;
			readln(ficMusniv, mus); 
			writeln('- ',i, ' ' + mus);
		end;
	close(ficMusniv);

	Repeat
		writeln('quelle musique voulez-vous?');
		readln (musique);
		reset(ficMusniv);
		while not (eof(ficMusniv)) do
			begin	
				readln(ficMusniv, mus);
					if (musique = mus) then
						choix := true;
			end;
		close(ficMusniv);
	until (choix = true);
	writeln('vous avez choisi la musique ', musique);
	
	
	
	
	

end;


{nom utilisateur}
procedure nomUser (var nom : String);
begin
	writeln('quel est votre nom?');
	readln(nom);
end;




END.
