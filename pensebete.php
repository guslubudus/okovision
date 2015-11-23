<?php
/*****************************************************
* Projet : Okovision - Supervision chaudiere OeKofen
* Auteur : Stawen Dronek
* Utilisation commerciale interdite sans mon accord
******************************************************/


/*
Statut_chaudiere : 
2 = Ventilations bruleur et fumées à 100%
3 = Allumage (T° flamme augmente, T° flamme consigne calée à 120°
4 = Alimentation Pellets (les fameux zs d'alim et pause)
5 = Fin de combustion, bruleur arrêté / on fini de ventiler
7 = Alim trémie effectivement

compter le nb de cycle : 4
alimentation pellet dans tremi : 7
*/

/*
$query .= "INSERT IGNORE INTO oko_histo_full VALUES (".
							"STR_TO_DATE('".$d[0]."','%d.%m.%Y'),'". //date
							$d[1]."',". 				// heure
							$this->cvtDec($d[2]).",". 	// T°C exterieur
							$this->cvtDec($d[3]).",". 	// T°C Chaudiere
							$this->cvtDec($d[4]).",". 	// T°C Chaudiere Consigne
							((int)$d[5])*100 .",". 		// Contact Bruleur
							$this->cvtDec($d[6]).",". 	// T°C Départ
							$this->cvtDec($d[7]).",". 	// T°C Départ Consigne
							$this->cvtDec($d[8]).",". 	// T°C Ambiante
							$this->cvtDec($d[9]).",". 	// T°C Ambiante Consigne
							((int)$d[10])*100 .",". 	// Circulateur Chauffage
							$this->cvtDec($d[11]).",". 	// T°C ECS
							$this->cvtDec($d[13]).",". 	// T°C ECS Consigne
							((int)$d[14])*100 .",". 	// Ciruclateur ECS
							$this->cvtDec($d[16]).",". 	// T°C panneau solaire
							$this->cvtDec($d[17]).",". 	// T°C Ballon Bas
							$this->cvtDec($d[18]).",". 	// Pompe Solaire
							$this->cvtDec($d[21]).",". 	// T°C Flamme
							$this->cvtDec($d[22]).",". 	// T°C Flamme Consigne
							$this->cvtDec($d[23]).",". 	// Vis Alimentation temps (ex: 50zs = 5sec)
							$this->cvtDec($d[24]).",". 	// Vis Alimentation Temps pause
							$this->cvtDec($d[25]).",". 	// Ventilation Bruleur
							$this->cvtDec($d[26]).",". 	// Ventilation fumée
							$this->cvtDec($d[27]).",". 	// Dépression
							$this->cvtDec($d[28]).",". 	// Depression Consigne
							$this->cvtDec($d[29]).",". 	// Statut Chaudiere
							((int)$d[30])*100 .",". 	// Moteur alimentation chaudiere
							((int)$d[31])*100 .",". 	// Moteur extraxtion silo
							((int)$d[32])*100 .",". 	// Moteur tremie intermediaire
							((int)$d[33])*100 .",". 	// Moteur ASPIRATION
							((int)$d[34])*100 .",". 	// Moteur Allumage
							$d[35].",". 				// Pompe du circuit primaire
							((int)$d[39])*100 .",".		// Moteur ramonage
							//Enregistrement de 1 si nous commençons un cycle d'allumage
							//Statut 3 = allumage
							$start_cycle.
							");\n";
*/



/*
SELECT table_schema AS NomBaseDeDonnees, ROUND(SUM( data_length + index_length ) / 1024 / 1024, 2) AS BaseDonneesMo FROM information_schema.TABLES GROUP BY TABLE_SCHEMA;
*/



/*

Create the branch on your local machine and switch in this branch :
	$ git checkout -b [name_of_your_new_branch]

Push the branch on github :
	$ git push origin [name_of_your_new_branch]

You can see all branches created by using :
	$ git branch

Delete a branch on your local filesystem :
	$ git branch -d [name_of_your_new_branch]

To force the deletion of local branch on your filesystem :
	$ git branch -D [name_of_your_new_branch]

Delete the branch on github :
	$ git push origin :[name_of_your_new_branch]

Merge
	$ git merge unstable
	
*/

//include_once 'config.php';
/*
echo "fuseau: ".date_default_timezone_get();

$date = new DateTime(); //, new DateTimeZone(date_default_timezone_get())
echo "offset:: ".$date->getOffset();
echo "date(p)::".date(P);



*/
//http://www.sitepoint.com/synchronize-php-mysql-timezone-configuration/
/*

ALTER TABLE `oko_historique_full` DROP COLUMN `timestamp`;

okovision.dronek.com -> www site de presentation
okovision.dronek.com/app -> l'application
okovision.dronek.com/api -> api de communication
okovision.dronek.com/back -> visualisation des stats
*/
//$a = new administration();

//$a->addOkoStat();

//echo $url.'<br/>';
//var_dump($resp);
$host = $_SERVER['HTTP_HOST'];
$folder = dirname($_SERVER['SCRIPT_NAME']);
$urlsrc = $host.$folder;
echo $urlsrc.'<br/>';
$token = rand();
//echo $token;
echo sha1($token);

//phpinfo();
?>
