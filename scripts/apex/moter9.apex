//Fusion Délegations dans les objets liés

List<D_l_gation__c> dl_nime=[SELECT id, Name from D_l_gation__c where Name='Délégation Nîmes'];
String id_dl_nime =dl_nime[0].id;
System.debug('Id DL Nîmes : ' + id_dl_nime);

List<Donprotocolairesiege__c> donvalidedirection=[SELECT id, Name, DL_DT__c from Donprotocolairesiege__c where DL_DT__r.Name='Délégation Avignon'];

for(Donprotocolairesiege__c obj : donvalidedirection)
{
	obj.DL_DT__c = id_dl_nime;

}
if(donvalidedirection.size() > 0)
{
	System.debug('size don with Name DL  Avignon : ' + donvalidedirection.size());
	update donvalidedirection;    //
}









List<D_l_gation__c> dl_nancy=[SELECT id, Name from D_l_gation__c where Name='Délégation Nancy'];
String id_dl_nancy =dl_nancy[0].id;
System.debug('Id DL Nancy : ' + id_dl_nancy);

donvalidedirection=[SELECT id,Name,DL_DT__c from Donprotocolairesiege__c where DL_DT__r.Name='Délégation Epinal'];

for(Donprotocolairesiege__c obj : donvalidedirection)
{
	obj.DL_DT__c = id_dl_nancy;

}
if(donvalidedirection.size() > 0)
{
	System.debug('size don with Name DL  Epinal : ' + donvalidedirection.size());
	update donvalidedirection;    //
}







List<D_l_gation__c> dl_albi=[SELECT id, Name from D_l_gation__c where Name='Délégation Albi'];
String id_dl_albi =dl_albi[0].id;
System.debug('Id DL Albi : ' + id_dl_albi);

donvalidedirection=[SELECT id,Name,DL_DT__c from Donprotocolairesiege__c where DL_DT__r.Name='Délégation Rodez'];

for(Donprotocolairesiege__c obj : donvalidedirection)
{
	obj.DL_DT__c = id_dl_albi;

}
if(donvalidedirection.size() > 0)
{
	System.debug('size don with Name DL  Rodez : ' + donvalidedirection.size());
	update donvalidedirection;    //
}




//Rénumération des délégations



List<D_l_gation__c> dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Bourges'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040816';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Tours'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040818';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Orléans'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040817';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Besançon'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040921';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Auxerre'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040920';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Dijon'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040923';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Chalon Sur Saône'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040922';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Nice'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040623';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Nîmes'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040624';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Ajaccio'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040619';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Toulon'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040625';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Marseille'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040622';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Montpellier'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040519';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Perpignan'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040520';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}
dl_modif=[SELECT Name, Code_UO__c from D_l_gation__c where Name='Délégation Carcassonne'];

for(D_l_gation__c obj : dl_modif)
{
	obj.Code_UO__c = 'C040518';

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

//Renomage des DR

List<Direction_R_gionale__c> dr=[SELECT id, Name from Direction_R_gionale__c where Name='DR Sud-Ouest Atlantique'];

for(Direction_R_gionale__c obj : dr)
{
	obj.Name='DR SUD OUEST';

}
if(dr.size() > 0)
{
	update dr;    //
}


dr=[SELECT id, Name from Direction_R_gionale__c where Name='DR R-A-A'];

for(Direction_R_gionale__c obj : dr)
{
	obj.Name='DR SUD EST';

}
if(dr.size() > 0)
{
	update dr;    //
}

dr=[SELECT id, Name from Direction_R_gionale__c where Name='DR ILE-DE-FRANCE CENTRE'];

for(Direction_R_gionale__c obj : dr)
{
	obj.Name='DR ILE de France';

}
if(dr.size() > 0)
{
	update dr;    //
}



//Mise à jour DR DE TOUTES les DL

List<Direction_R_gionale__c> dr_sudouest=[SELECT id, Name from Direction_R_gionale__c where Name='DR SUD OUEST'];
String id_drsudoust =dr_sudouest[0].id;


dl_modif=[SELECT Name, Code_UO__c,DR__c from D_l_gation__c where Code_UO__c like 'C0405%' ];

for(D_l_gation__c obj : dl_modif)
{
	obj.DR__c=id_drsudoust;

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


List<Direction_R_gionale__c> dr_sudest=[SELECT id, Name from Direction_R_gionale__c where Name='DR SUD EST'];
String id_drsudest =dr_sudest[0].id;


dl_modif=[SELECT Name, Code_UO__c,DR__c from D_l_gation__c where Code_UO__c like 'C0406%' ];

for(D_l_gation__c obj : dl_modif)
{
	obj.DR__c=id_drsudest;

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


List<Direction_R_gionale__c> dr_iledefrance=[SELECT id, Name from Direction_R_gionale__c where Name='DR ILE de France'];
String id_driledefrance =dr_iledefrance[0].id;


dl_modif=[SELECT Name, Code_UO__c,DR__c from D_l_gation__c where Code_UO__c like 'C0407%' ];

for(D_l_gation__c obj : dl_modif)
{
	obj.DR__c=id_driledefrance;

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

List<Direction_R_gionale__c> dr_ouest=[SELECT id, Name from Direction_R_gionale__c where Name='DR OUEST'];
String id_drouest =dr_ouest[0].id;


dl_modif=[SELECT Name, Code_UO__c,DR__c from D_l_gation__c where Code_UO__c like 'C0408%' ];

for(D_l_gation__c obj : dl_modif)
{
	obj.DR__c=id_drouest;

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}

List<Direction_R_gionale__c> dr_nordest=[SELECT id, Name from Direction_R_gionale__c where Name='DR NORD EST'];
String id_nordest =dr_nordest[0].id;


dl_modif=[SELECT Name, Code_UO__c,DR__c from D_l_gation__c where Code_UO__c like 'C0409%' ];

for(D_l_gation__c obj : dl_modif)
{
	obj.DR__c=id_nordest;

}
if(dl_modif.size() > 0)
{
	update dl_modif;    //
}


//SUPPRESSION DL ET DR

List<D_l_gation__c> dl_supprime=[SELECT Name from D_l_gation__c where Name='Délégation Avignon' ];

if(dl_supprime.size() > 0)
{
	delete dl_supprime;    //
}

dl_supprime=[SELECT Name from D_l_gation__c where Name='Délégation Epinal' ];


if(dl_supprime.size() > 0)
{
	delete dl_supprime;    //
}


dl_supprime=[SELECT Name from D_l_gation__c where Name='Délégation Rodez' ];


if(dl_supprime.size() > 0)
{
	delete dl_supprime;    //
}



/*List<Direction_R_gionale__c  > dr_supprime=[SELECT Name from Direction_R_gionale__c where Name='DR SUD-MED' ];


if(dr_supprime.size() > 0)
{
	delete dr_supprime;    //
}*/


