program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, crt, sysutils, keyboard,   {$ifdef Unix} unix {$endif}, IGRTypes, IGRInterface, IGRSon, IGRJeu, IGRScore;




////////////////////////////////////////////////////////////////////////////////////////////


var niveau : Word;
	
	
	musique : String;
	player : Joueur;
	tabScores : HighScores;
	finPartie : Boolean;
	choixMenu : Word;
	

BEGIN
	finPartie := False;
	
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	InitKeyBoard();
	
	startScreen;
	joueur(player);
	repeat

		
		
		menu(choixMenu, player);

		
		case choixMenu of
			1 : lancementPartie(player, tabScores, finPartie);
			2 : begin
					difficulte(niveau, player);
					choixMusique(niveau, musique);
					afficherHighscores(musique, player, tabScores);
					writeln;
					writeln;
					writeln('Appuyez sur [ESPACE] pour continuer...');
	
					while GetKeyEventChar(TranslateKeyEvent(GetKeyEvent())) <> ' ' do
						sleep(10);
				
					clrscr;
					
				end;
			3 : choixMenu := 3;
		end;
		
		
	until finPartie;


	DoneKeyboard();


END.


