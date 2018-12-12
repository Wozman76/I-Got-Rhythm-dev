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
procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores; var nbScores : Word);
procedure stockageScore(player : Joueur; score : Word; var tabScores : Highscores; nbScores : Word; musique : String);


Implementation




procedure afficherScore(score : Word);
begin
GotoXY(30, 25);
writeln('Vous avez fait : ', score);
end;


procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores; var nbScores : Word);
var fichier : File of Joueur;
	j : Word;
	playerFichier : Joueur;
begin

	nbScores := 0;
	assign(fichier, 'scores/' + musique + '_scores.dat');
	if not(DirectoryExists('scores')) then
		CreateDir('scores');
	if not(FileExists('scores/' + musique + '_scores.dat')) then
	 
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


procedure stockageScore(player : Joueur; score : Word; var tabScores : Highscores; nbScores : Word; musique : String);
var fichier : File of Joueur;
	j : Integer;
begin

	player.score := score;
	
	assign(fichier, 'scores/' + musique + '_scores.dat');
	
		
	ajoutScoreTableau(player, nbScores, tabScores);

	
	rewrite(fichier);
	
	if nbScores >= 5 then
		nbScores := 4;
		
	for j := 1 to nbScores + 1 do
		write(fichier, tabScores[j]);
		
		
	close(fichier);
	

end;



 


END.
