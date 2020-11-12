# SFDX App

Dons protocolaires, application Sacem-Dons.

## Dev, Build and Test

Avant tout développement:

- récupérer le projet: git clone git@git.sacem.fr:SALSA/DONS.git
- faire un git checkout dev
- git pull
- git checkout -b ma-branche
  => La branche de dev sert de branche d'intégration des dev et sera la référence du code du package versionné

Création de la scratch-org:

- Définir la devhub: sfdx force:config:set defaultdevhubusername=etienne.griette@externe.sacem.fr
- sfdx force:org:create -s -f config/project-scratch-def.json -a <alias>
  ou demander à un admin de créer la scratch-org si pas d'accès à la dev-hub
- Installer les package "SDocs 2019 Spring (2.875)" et "Docomotion4CPQ Docomotion4X 12" utilisés pas cette application:
  sfdx force:package:install -p 04t2K000000WifrQAC -w 1000 -u ... (ajouter -u <alias> si pas de -s lors de la création de la scratch-org)
  sfdx force:package:install -p 04t3Y0000018TwMQAU -w 1000 -u ...
- Deployer les profiles: sfdx force:mdapi:deploy -f ./package/unpackaged.zip -u ...
- Synchroniser l'org sfdx force:source:push -u ...
- Assigner le permissionSet au user, pour avoir accès à l'app: sfdx force:user:permset:assign -n SacemDons -u ...
  cela permet aussi d'ajouter les droits sur les objets / tabs / recordtype / apex
- Ouvrir la scratch-org: sfdx force:org:open (pas de mot de passe necessaire)

Remarques:

- Attention, lors de la synchro, les répertoires profile\* sont dans .gitignore et ne doivent pas partir non plus dans le package. Il faudra réfléchir à une gestion des profiles par environnement.
  Passage de profile a permissionSet:
  Les userPermmission / layoutAssignment et default=true pour les recordType restent geres par Profile
  Cela permet de limiter les modification sur les profiles, qui ne sont pas livrés dans ce package, car peuvent être partagés
- Pour créer les délégations, cd config; groovy create_delegations.groovy username
- Pour créer les users, aller dans config, puis groovy create*users.groovy adresse_mail_pour_tous_les_users*(votre_adresse) alias_scratch_org

Ensuite pour synchroniser les dev, utiliser simplement:

- sfdx force:source:pull et sfdx force:source:push

On peut aussi développer sur une Sandbox bien que ce soit moins pratique:

- Idem que pour la scratch-org: Installer les deux packages Pardot et Doco puis sfdx force:source:deploy -u etienne.griette@externe.sacem.fr.sacemdons
  le source:deploy contrairement au source:push écrase le code existant (pas de delta)
- Vérifier les permissions set et profiles
- Une fois les dev terminés, faire un package (ne pas versionner le package) et récupérer les sources:
  sfdx force:source:retrieve -u etienne.griette@externe.sacem.fr.sacemdons -n "monPackage" => va placer dans le folder monPackage les sources. Copier les sources vers force-app.
  On peut aussi faire un retrieve avec un package.xml ou en précisant les metadata à récupérer mais il faut savoir exactement ce qu'on a modifié.

Integration de dev

- Faire un job jenkins par package qui automatise la création de la scratch-org et déroule les tests à chaque push (git) sur dev, pour ce projet git <=> package => Partiellement réalisé
- Enchaîner vaec un job jenkins (post-build) qui déploie les packages sur la SB d'intégration et dérouler les tests => Fait
- Faire un job à (déclenchement auto ?) pour la création des packages releasés depuis la (les ?) branche release/x.x de git => Partiellement réalisé

Pour la recette

- git checkout dev
- git pull
- git checkout -b release/x.x
  si il s'agit d'une nouvelle release, ne pas oublier d'incrémenter dans le sfdx-project.json le deuxième chiffre de la version (minor) ou major, car le promote (le promote du package est nécessaire avant MEP) ne fonctionnera pas sinon
- Job jenkins créant le package x.x.x à partir de cette branche, déploiement avec le job jenkins de déploiement, tag de la version git

Les approval process ne sont pas gérable par unmanaged package, il font donc les récupérer par retrieve
exemple sfdx force:source:retrieve -u etienne.griette@sacem.fr.donsdev -m ApprovalProcess
, ces process doivent être nettoyés de toutes adresses mail propres à l'env de dev
Idem EmailTemplate Exemple de récupération des metadata email template:
sfdx force:source:retrieve -m EmailTemplate:unfiled\$public\/Approval_process_Direction_R_seau -u etienne.griette@sacem.fr.donsdev

TODO:

- les checkbox dans les critères des approval process contiennent des valeurs différentes suivant la langue de l'org source (pourquoi ? correction ou solution de contournement ?). Ce n'est pas trop génant, il faut penser à les mettre en français.
- Eviter les références vers des IDs (templates docomotion), pour éviter des modifications manuelles à chaque livraison
- Prévoir un external id sur chaque objet, afin de pouvoir importer facilement des objets dans une autre org (les ID étant générés par salesforce)

## Resources

## Description of Files and Directories

## Issues

- Format et nomenclature !

# Packages dependences

04t2K000000WifrQAC => SDocs 2.875.0.1
#04t1W0000006HZyQAM => pardot 4.57.0.1
#04t6A000003OizhQAC => Custom Lightning Navigation Buttons 1.3.0.1
#04t3Y000000jvsuQAA => Docomotion4CPQ 12.3.0.2
04t3Y0000018TwMQAU => Docomotion4CPQ 12.21.0.14
