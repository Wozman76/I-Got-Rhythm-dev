unit IGRScore;



Interface
uses sysutils, crt, IGRTypes;

procedure afficherScore(score : Word);
procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores);
procedure stockageScore(player : Joueur; score : Word; var tab : Highscores; musique : String);
procedure ajoutScoreTableau(player : Joueur; taille : Integer; var tab : HighScores);

Implementation




procedure afficherScore(score : Word);

begin
GotoXY(30, 25);
write('Vous avez fait : ', score);
end;


procedure afficherHighscores(musique : String; var player : Joueur; var tabScores : HighScores);
var fichier : File of Joueur;
	j : Integer;
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


procedure stockageScore(player : Joueur; score : Word; var tab : Highscores; musique : String);
var fichier : File of Joueur;
	j, nbScores : Integer;
	
begin
	player.score := score;
	
	assign(fichier, musique + '_scores.dat');
	
	//-------
	nbScores := 0;

	if not(FileExists(musique + '_scores.dat')) then
	 
		rewrite(fichier)
		
	else reset(fichier);
	
	while not(eof(fichier)) do
			nbScores := nbScores + 1;
	

	close(fichier);
	
	//-------
		
	ajoutScoreTableau(player, nbScores, tab);

	
	rewrite(fichier);
	
	if nbScores >= 5 then
		nbScores := 4;
		
	for j := 1 to nbScores + 1 do
		write(fichier, tab[j]);
		
	close(fichier);

	
end;

procedure ajoutScoreTableau(player : Joueur; taille : Integer; var tab : HighScores);
var pos : Integer;
begin
	if taille < 10 then
		begin
			pos := taille + 1;
			while (pos > 1) and (tab[pos - 1].score > player.score) do
				begin
					tab[pos] := tab[pos - 1];
					pos := pos - 1;
				end;
			tab[pos].nom := player.nom;
			tab[pos].score := player.score;
			taille := taille + 1;
			
		end;


end;




END.
