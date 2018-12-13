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
	nbScores : Word;
	sound : pMIX_MUSIC;

BEGIN

	finPartie := False;
	SDL_Init(SDL_INIT_AUDIO);
	son(sound, 'Invincible');
	{$ifdef Unix}
	SysUtils.ExecuteProcess('/usr/bin/tput', 'civis', []); ///enleve curseur
	{$endif}
	
	InitKeyBoard();

	startScreen;
	joueur(player);

	repeat
		
		menu(choixMenu, player);

		
		case choixMenu of
			1 : lancementPartie(player, tabScores, finPartie, sound);
			2 : begin
					difficulte(niveau, player);
					choixMusique(niveau, musique);
					afficherHighscores(musique, player, tabScores, nbScores);
					writeln;
					writeln;
					writeln('Appuyez sur [ESPACE] pour continuer...');
	
					while GetKeyEventCode(GetKeyEvent()) <> 14624 do
						sleep(10);
				
					clrscr;
					
				end;
			3 : credits(sound);
		end;
		
		if not(choixMenu = 2) then
			son(sound, 'Invincible');
		
	until finPartie;

	stopSon(sound);
	DoneKeyboard();


END.


