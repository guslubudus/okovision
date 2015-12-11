<?php

/*****************************************************
* Projet : Okovision - Supervision chaudiere OeKofen
* Auteur : Stawen Dronek
* Utilisation commerciale interdite sans mon accord
******************************************************/

class realTime extends connectDb{
	
	public function __construct() {
		parent::__construct();
	}
	
	public function __destruct() {
		parent::__destruct();
	}
	
	private function sendResponse($t){
        header("Content-type: text/json; charset=utf-8");
		echo $t;
    }
	
	
	public function getOkoValue($data = array()){
		
		$o = new okofen();
        $o->requestBoilerInfo( $data );
        
		$r = array();
		//$r = stdObject();
		
		
		$dataBoiler = json_decode($o->getResponseBoiler());
		
		if($o->isConnected()){
			foreach($dataBoiler as $capt){
				
				if($capt->formatTexts != ''){
					
					$shortTxt 	= 'ERROR';
					$value		= 'null';
					$s= array();
					
					
					if($capt->value != '???'){
						$s = explode ("|",$capt->formatTexts);
						$shortTxt 	= $capt->shortText;
						$value		= $s[$capt->value];
					}
					
					$r[$capt->name] = (object) array(
											"value" => $value,
											"unitText" => ''
											);
				}else{
					$r[$capt->name] = (object) array(
											"value" => ($capt->divisor != '' && $capt->divisor != '???' )?($capt->value / $capt->divisor):($capt->value),
											"unitText" => ($capt->unitText=='???')?'':(($capt->unitText=='K')?'°C':$capt->unitText)
											);
				}
			}
		}
		return $r;
		
	}
	
	

    public function getIndic(){
    	$json['response'] = false;
    	
    	$indic = array( "CAPPL:FA[0].L_mittlere_laufzeit" 			, // temps moyen du bruleur
						"CAPPL:FA[0].L_brennerstarts" 				, // nb demarrage bruleur
						"CAPPL:FA[0].L_brennerlaufzeit_anzeige" 	, //fonct brûleur
						"CAPPL:FA[0].L_anzahl_zuendung" 			, //nb allumage
						"CAPPL:LOCAL.touch[0].version" 				, // version
						//chauffage -> T°C ambiamte
						"CAPPL:LOCAL.hk[0].raumtemp_heizen"			,//T°C ambiant confort
						"CAPPL:LOCAL.hk[0].raumtemp_absenken"		,//T°C ambiant reduit
						"CAPPL:LOCAL.hk[0].heizkurve_steigung"		,//pente
						"CAPPL:LOCAL.hk[0].heizkurve_fusspunkt"		,//pied de courbe
						"CAPPL:LOCAL.hk[0].heizgrenze_heizen"		,//T°c ext de coupure (Confort)
						"CAPPL:LOCAL.hk[0].heizgrenze_absenken"		,//T°c ext de coupure (Reduit)
						//Chauffage -> Gestion Eau dans Radiateur
						"CAPPL:LOCAL.hk[0].vorlauftemp_max"			,//T°C depart Max
						"CAPPL:LOCAL.hk[0].vorlauftemp_min"			,//T°C depart Min
						"CAPPL:LOCAL.hk[0].ueberhoehung"			,//Augmentation
						"CAPPL:LOCAL.hk[0].mischer_max_auf_zeit"	,//V3V Ouverture
						"CAPPL:LOCAL.hk[0].mischer_max_aus_zeit"	,//V3V Pause
						"CAPPL:LOCAL.hk[0].mischer_max_zu_zeit"		,//V3V Fermeture
						"CAPPL:LOCAL.hk[0].mischer_regelbereich_quelle",//Plage réglage TC
						"CAPPL:LOCAL.hk[0].mischer_regelbereich_vorlauf",//Plage réglage TD
						"CAPPL:LOCAL.hk[0].quellentempverlauf_anstiegstemp",//Hausse ETC
						"CAPPL:LOCAL.hk[0].quellentempverlauf_regelbereich",//Correction réglage ETC (Evolution Température Chaudière)
						//	Parametrage bruleur :
						"CAPPL:FA[0].pe_kesseltemperatur_soll"		,//T°C Consigne
						"CAPPL:FA[0].pe_abschalttemperatur"			,//T°C Coupure
						"CAPPL:FA[0].pe_einschalthysterese_smart" 	,// Hysteresis marche
						"CAPPL:FA[0].pe_kesselleistung" 			 //Puissance chaudiere
                   	) ;
    	
    	
    	$r = $this->getOkoValue($indic);
	
		
		if(!empty($r)){	
			$tmp = array();
			
			foreach($indic as $key){
				$tmp[$key] = trim($r[$key]->value.' '.$r[$key]->unitText);
			}
			$json['data'] = $tmp;
			$json['response'] = true;	
		}
		
		//var_dump($resp);		                
		$this->sendResponse(json_encode($json));
    }
    
    
    public function setOkoLogin($user,$pass){
		
		$pass = base64_encode( $this->realEscapeString($pass) );
		$userId = session::getInstance()->getVar("userId");
		$r['response'] = false;
		
		$q = "update oko_user set login_boiler='$user', pass_boiler='$pass' where id=$userId";
		$this->log->debug("Class ".__CLASS__." | ".__FUNCTION__." | ".$q);
		
		if($this->query($q)){
			$o = new okofen();
			$o->boilerDisconnect();
			$r['response'] = true;
		}
		
		$this->sendResponse(json_encode($r));
	}
	
	public function getdata(){
		$r = $this->getOkoValue(array(
									"CAPPL:FA[0].L_feuerraumtemperatur" // t°c flamme
									)
		
				                );
		
		
		$resultat = '[{ "name": "test serie 1",';
		$data= '['.substr($r['CAPPL:LOCAL.L_fernwartung_datum_zeit_sek']->value,0,-7).'000,'.$r['CAPPL:FA[0].L_feuerraumtemperatur']->value.']';
		
		$resultat .= '"data": '.$data;
		$resultat .= '},';
		
		$resultat .= '{ "name": "test serie 2","data": ['.substr($r['CAPPL:LOCAL.L_fernwartung_datum_zeit_sek']->value,0,-7).'000,150]}]';
		
		
			                
		$this->sendResponse($resultat);		                
	}
    
}

?>