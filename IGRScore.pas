unit IGRScore;

{
    ____   ______      __     ____  __          __  __            
   /  _/  / ________  / /_   / __ \/ /_  __  __/ /_/ /_  ____ ___ 
   / /   / / __/ __ \/ __/  / /_/ / __ \/ / / / __/ __ \/ __ `__ \
 _/ /   / /_/ / /_/ / /_   / _, _/ / / / /_/ / /_/ / / / / / / / /    
/___/   \____/\____/\__/  /_/ |_/_/ /_/\__, /\__/_/ /_/_/ /_/ /_/ 
                                      /____/                      
}


Interface
uses sysutils, crt, IGRTypes;

procedure afficherScore(score : Word);
procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores);
procedure stockageScore(player : Joueur; score : Word; var tabScores : Highscores; musique : String);
//procedure ajoutScoreTableau(player : Joueur; nbScores : Integer; var tabScores : HighScores);

Implementation



{affiche le score du joueur}
procedure afficherScore(score : Word);

begin
GotoXY(30, 25);
writeln('Vous avez fait : ', score);
end;


{va chercher les données des scores dans le fichier de la musique et affiche les 5 meilleurs scores}
procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores);
var fichier : File of Joueur;
	j : Word;
	playerFichier : Joueur;
	var nbScores : Integer;
begin
	nbScores := 0;
	assign(fichier, musique + '_scores.dat');							// prend fichier et s'il n'existe pas le crée
	if not(FileExists(musique + '_scores.dat')) then
	 
		rewrite(fichier)
		
	else reset(fichier);
	
	while not(eof(fichier)) do
		begin
			nbScores := nbScores + 1;
			read(fichier, playerFichier);
			tabScores[nbScores] := playerFichier;
			
		end;
	close(fichier);
	
	
	
	writeln('Liste des meilleurs scores :');
	writeln;

	writeln('Scores pour ' + musique +' :');
	writeln;

	for j := 1 to nbScores do
		writeln('- ', tabScores[j].nom, ' : ', tabScores[j].score);
	writeln;
	

end;


{ajoute le score du joueur dans le tableau des scores ordonnée decroissant en passant par un tableau temporaire}
procedure ajoutScoreTableau(player : Joueur; nbScores : Integer; var tabScores : HighScores);
var i, j : Word;
	tabTempScores : HighScores;
begin


	i := 1;
	while (i < nbScores + 1) and (player.score < tabScores[i].score) do
		begin
			tabTempScores[i] := tabScores[i];
			i := i + 1;
		end;	
	tabTempScores[i] := player;
	
	if i < nbScores + 1 then
		for j := i to nbScores do
		tabTempScores[j + 1] := tabScores[j];
		

		
	for j := 1 to nbScores + 1 do
		tabScores[j] := tabTempScores[j];

end;


{enregistre le tableua des score dans le fichier en ne gardant que les 5 meilleurs scores}
procedure stockageScore(player : Joueur; score : Word; var tabScores : Highscores; musique : String);
var fichier : File of Joueur;
	j, nbScores : Integer;
	playerFichier : Joueur;
	
begin

	nbScores := 0;
	player.score := score;
	
	assign(fichier, musique + '_scores.dat');
	

	if not(FileExists(musique + '_scores.dat')) then
	 
		rewrite(fichier)
		
	else 
	begin
	reset(fichier);
	

	while not(eof(fichier)) do											//trouve la taille du tableau
		begin
			nbScores := nbScores + 1;
			read(fichier, playerFichier);
			tabScores[nbScores] := playerFichier;
			
		end;
	end;

	close(fichier);
	

		
	ajoutScoreTableau(player, nbScores, tabScores);						//crée le nouveau tableau avec le score du joueur

	
	rewrite(fichier);
	
	if nbScores >= 5 then												// réduit taille du tableau a 5
		nbScores := 4;
		
	for j := 1 to nbScores + 1 do
		write(fichier, tabScores[j]);									//écrit les score dans le fichier
		
		
	close(fichier);
	

end;



 


END.
