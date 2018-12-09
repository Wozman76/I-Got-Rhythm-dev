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
procedure ajoutScoreTableau(player : Joueur; taille : Integer; var tabScores : HighScores);

Implementation




procedure afficherScore(score : Word);

begin
GotoXY(30, 25);
writeln('Vous avez fait : ', score);
end;


procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores);
var fichier : File of Joueur;
	j : Word;
	playerFichier : Joueur;
	var nbScores : Integer;
begin
	nbScores := 0;
	assign(fichier, musique + '_scores.dat');
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


procedure stockageScore(player : Joueur; score : Word; var tabScores : Highscores; musique : String);
var fichier : File of Joueur;
	j, nbScores : Integer;
	playerFichier : Joueur;
	
begin
	player.score := score;
	
	assign(fichier, musique + '_scores.dat');

	
	//-------
	
	nbScores := 0;

	if not(FileExists(musique + '_scores.dat')) then
	 
		rewrite(fichier)
		
	else 
	reset(fichier);
	

	while not(eof(fichier)) do
		begin
			read(fichier, playerFichier);
			tabScores[nbScores] := playerFichier;
			nbScores := nbScores + 1;
		end;


	

	close(fichier);

	//-------
		
	ajoutScoreTableau(player, nbScores, tabScores);

	
	rewrite(fichier);
	
	if nbScores >= 5 then
		nbScores := 4;
		
	for j := 1 to nbScores + 1 do
		write(fichier, tabScores[j]);
		
	close(fichier);


end;

procedure ajoutScoreTableau(player : Joueur; taille : Integer; var tabScores : HighScores);
var pos : Integer;
begin

	if taille < 10 then
		begin
			pos := taille + 1;
			while (pos > 1) and (tabScores[pos - 1].score < player.score) do
				begin
					tabScores[pos] := tabScores[pos - 1];
					pos := pos - 1;
				end;
			tabScores[pos].nom := player.nom;
			tabScores[pos].score := player.score;
			taille := taille + 1;
			
		end;


end;




END.
