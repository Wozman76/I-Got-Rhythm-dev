program testeur;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


uses sdl, sdl_mixer_nosmpeg, crt, sysutils, keyboard,   {$ifdef Unix} unix, {$endif} IGRTypes, IGRInterface, IGRSon, IGRJeu, IGRScore;




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
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); 				//enleve curseur
	{$endif}
	
	InitKeyBoard();
	
	startScreen;														//apparaître écran d'acceuil
	joueur(player);														//entre nom joueur
	repeat

		
		
		menu(choixMenu, player);

		
		case choixMenu of
			1 : lancementPartie(player, tabScores, finPartie);			//lance la partie si le choix etait 1
			2 : begin
					difficulte(niveau, player);							//demande difficulté
					choixMusique(niveau, musique);						//demande musique
					afficherHighscores(musique, player, tabScores);		//affiche les 5 meilleurs scores
					writeln;
					writeln;
					writeln('Appuyez sur [ESPACE] pour continuer...');
																		//tant qu'on appuis ps sur 'espace', le programme attend
					while GetKeyEventChar(TranslateKeyEvent(GetKeyEvent())) <> ' ' do
						sleep(10);
				
					clrscr;
					
				end;
			3 : choixMenu := 3;
		end;
		
		
	until finPartie;


	DoneKeyboard();


END.


