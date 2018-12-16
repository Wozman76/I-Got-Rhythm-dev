unit IGRJeu;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


Interface

uses sdl, sdl_mixer_nosmpeg, crt, sysutils, DateUtils, keyboard, IGRTypes, IGRInterface, IGRSon, IGRScore;


procedure lancementPartie(var player : Joueur; var tabScores : HighScores; var again : Boolean);
procedure initTab(music : String; var tab : TabMusic);
procedure partie(var sound : pMIX_MUSIC; musique : String; tab : TabMusic; var score : Word);
procedure verifTouche(var tab : TabMusic; i : Word; deb : TDateTime; var score, compteur, b : Word);

Implementation


procedure lancementPartie(var player : Joueur; var tabScores : HighScores; var again : Boolean);
var musique : String;
	niveau : Word; 
	tab : TabMusic;
	sound: pMIX_MUSIC=NIL;
	score : Word;
begin
	difficulte(niveau, player);
	
	choixMusique(niveau, musique);
	
	afficherHighscores(musique, player, tabScores);

	sleep(3000);
	
	clrscr;
	
	
	SDL_Init(SDL_INIT_AUDIO);

	
	initTab(musique,tab);
	afficherInterface;
	compteRebour();
	partie(sound, musique, tab, score);
	sleep(2000);
	clrscr;
	
	stockageScore(player, score, tabScores, musique);
	afficherHighscores(musique, player, tabScores);
	afficherScore(score);
	sleep(2000);





	nouvellePartie(again, player);
	MIX_FREEMUSIC(sound);
	Mix_CloseAudio();
end;





{initialise le tableau de touche en allant chercher les données dans le fichier de a musique}
procedure initTab(music : String; var tab : TabMusic);
var i : Integer;
	fichier : file of Touche;
begin

	i := 0;
	assign(fichier, music + '.song');
	reset(fichier);
	
	while not eof(fichier) do
		begin
			i := i + 1;
			read(fichier, tab[i]);										//met les informations dans le tableau
			tab[i].visible := False;									//on initialise tous les booléens de visibilité a faux

		
			case tab[i].key of 											// donne les positions X en fonctions de la lettre trouvée dans le fichier
				'c' : tab[i].posX := 30;
				'v' : tab[i].posX := 34;
				'b' : tab[i].posX := 38;
				'n' : tab[i].posX := 42;
				'?' : tab[i].posX := 46;
			end;
			
			tab[i].posY := 2;											//toutes les brics vont partir du haut du tableau
			
		end;
end;
		
{partie de jeu permet desavoir quelle donnée il faut afficher et tester les touches appuyées et compter le score}		
procedure partie(var sound : pMIX_MUSIC; musique : String; tab : TabMusic; var score : Word);
var i, minVis, maxVis : Word;
	deb : TDateTime;
	compteur, b : Word;
	fin : Boolean;

begin
minVis := 1;
compteur := 0;
b := 1;
son(sound, musique);

deb := Now;


while not(tab[minVis].visible) do										//on attend que la première touche soit visible c'est a dire son temps est son temps donné -18*50 le temps de descendre la grille
	begin
	if (MilliSecondsBetween(Now, Deb) > tab[minVis].temps - (18*50)) then
		begin
			tab[minVis].visible := True;
			maxVis := 1;
		end;
	end;


repeat

	
		


	if (tab[minVis].visible = False) and ((maxVis - minVis) > 0) then	//si la premiere donnée visible n'est plus visible alors on passe au rang suivnat pour la borne minimal qu'on regarde
			begin
			minVis := minVis + 1;
			end;



	if (MilliSecondsBetween(Now, Deb) > tab[maxVis + 1].temps - (18*50)) then
		begin															// si le temps de la dernière touche visible est dépassé alors on regarde si la suivante est visible
			maxVis := maxVis + 1;
			tab[maxVis].visible := True;
		end;


			GotoXY(1,1);												//on affiche en haut à gauche le temps le score et le multiplicateur
			write(trunc(MilliSecondsBetween(Now, deb)/1000/60),'min ', trunc((MilliSecondsBetween(Now, deb)/1000/60 - trunc(MilliSecondsBetween(Now, deb)/1000/60))*60),'s ');
			GotoXY(1,2);
			write('Score : ', score);
			GotoXY(1,3);
			write('Multiplicateur : x',b);
			//GotoXY(1,4);
			//write('D''affilé : ',compteur);



	
		
	for i := minVis to maxVis do										//Entre les deux bornes visibles, on affiche les brics et on descend d'un leur position à chaque fois
		begin

			if tab[i].temps = 0 then
				fin := True;
				
			if (MilliSecondsBetween(Now, deb) > tab[i].temps) then
				begin
					tab[i].visible := False;

					GotoXY(tab[i].posX, tab[i].posY);
					if not(fin) then
						write('-');
					if (MilliSecondsBetween(Now, deb) > tab[i].temps) and (tab[i].appui = False) then
						begin											//si ona oublier d'appuyer sur la touche alors le compteur repart à zéro et le bonus à 1
							compteur := 0;
							b := 1;
						end;
				end
				
			else 
				begin
				
				
					GotoXY(tab[i].posX, tab[i].posY - 1);				//On descend a chaque fois la brique d'une position sauf si elle est déjà en bas 
					write(' ');
					GotoXY(tab[i].posX, tab[i].posY);
					write('=');
				
				
					 if tab[i].posY + 1 <= 18 then
						tab[i].posY := tab[i].posY + 1;

			

				end;
			verifTouche(tab, i, deb, score, compteur, b);				//On test si la touche appuyée est la bonne si oui le score augmente et le compteur aussi
		
		end;
	delay(50);

	
	
until (fin);

	
		
		
end;



{vérifie si les touches sont bien appuyées et calcul le sore correspondnat avec le bonus}
procedure verifTouche(var tab : TabMusic; i : Word; deb : TDateTime; var score, compteur, b : Word);
var motTape : TKeyEvent;
	touche : Char;

begin
If PollKeyEvent <> 0 then												//si une touche est appuyée
	begin
		motTape := GetKeyEvent;
		
		touche := GetKeyEventChar(TranslateKeyEvent(motTape));

		if (touche = 'c') or (touche = 'v') or (touche = 'b') or (touche = 'n') or (touche = ',') then
			begin
				if touche = ',' then touche := '?';						//si la touche est appuyée au bon moment et que c'est la bonne touche
				if  (MilliSecondsBetween(deb, Now) < tab[i].temps + 100) and (MilliSecondsBetween(deb, Now) > tab[i].temps - 100) and (touche = tab[i].key) then
					begin
						tab[i].appui := True;							//Le booleen devient vrai et on augmente le score et le compteur
						score := score + 1 * b;
						compteur := compteur + 1;
						case compteur of 								// en fonction du compteur on a un coefficient multiplicateur b
							2 : b := 2;
							4 : b := 3;
							6 : b := 4;
						end;
	
					end	
				else 
					begin
						compteur := 0;									//sinon le compteur et b reviennent à 0
						b := 1;
					end;
			end;
	
	end;
end;






END.
