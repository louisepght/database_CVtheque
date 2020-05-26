# Note de clarification

## Contexte et objectifs
Le projet CV-thèque consiste à mettre en place un système capable de gérer des CV de plusieurs candidats. Ces candidats seront en mesures de créer leur CV et de le modifier. Les recruteurs pourront être capable de filtrer les données des candidats en fonction des données présentes dans leur CV.
Les données qui constitueront le CV des canditats seront présentées sous forme d'une base de données. Il s'agit ici de créer la base de données, mais pas le developpement de l'application.
Cette base de données doit permettre de gérer des personnes, ainsi que l'ensemble des informations qui leur sont associées et qui sont nécessaires à la production d'un CV.

## Acteurs du projet
La maitrise d'ouvrage est représentée par M. Amarouche. 
La maitrise d'oeuvre est Louise Poughet (GI01). 

## Livrables de l’étude
Dans le cadre de ce projet, plusieurs livrables sont attendus, ils sont jalonnés sur 4 à 5 phases. 
Chaque livrable sera livré deux jours avant la date du TD correspondant.

### Phase 1 : le 25 mai 
Note de clarification et modèle conceptuel de données. 

### Phase 2 : le 1er juin 
Note de clarification, modèle conceptuel de données, modèle logique de données, implémentation SQL (create, insert). 

### Phase 3 : le 8 juin 
Note de clarification, modèle conceptuel de données, modèle logique de données, implémentation SQL (create, insert),
SQL INSERT, ainsi qu'un complément de normalisation. 

### Phase 4 : le 15 juin 
Révision complète du projet : version 2. 

## Si nécessaire (si l'UV n'a pas été validée): 
Phase 5 : le 22 juin
Révision complète du projet : version 3. 


## Contraintes
Les livraisons devront être compatible avec l'environnement de travail de la maitrise d'ouvrage. 
Ainsi, le diagramme UML sera codé en PLANTUML, et le code devra être compatible avec la version PostgreSQL du parc informatique UTC.

## Risques
Les risques suivants seront à prendre en considération : 
-mauvaise maîtrise des outils informatique 
-manque d'aisance avec les langages utilisés
-imprévus matériel comme une panne 
-mauvaise organisation

## Système d’information et de communication
Le cahier des charges est diponible sur librecours (https://librecours.net/dawa/projets-2020-II/co/kaci-cv.html)

Chaque livrable sera sous la forme d'un commit Git sur le répertoire du projet. Ce répertoire est partagé avec M. AMAROUCHE. 
La communication entre la maitrise d'oeuvre et la maitrise d'ouvrage se fera par Mattermost.

Le projet repose sur plusieurs dispositif : 
-le système de gestion de base de données PostgreSQL
-le langage PLANTUML pour la modélisation conceptuelle de données.


## Fonctionnalités du système
La base de données doit permettre de gérer des personnes, 
ainsi que l'ensemble des informations qui leur sont associées et qui sont nécessaires à la production d'un CV.

L'application doit répondre à certains besoins, elle doit donner par exemple :
- possibilité de faire des requêtes sur la base de données comme : 

    donner le nombre de candidats par domaine d'études, donner la liste des candidats ayant comme compétence base de données et plus de 5 ans d'expériences
, synthétiser le parcours de chaque candidat en précisant la liste de ses diplômes, la liste des postes occupés, le nombre d'expériences professionnelles acquises, les langues maîtrisées; 
la recherche multicritères des candidats en fonction du nombre d'expériences professionnelles, de l'année d'obtention de dernier diplôme, du poste souhaité.

- possibilité de modifier, ajouter ou supprimer des éléments de la base de donnée.

## Définition des objets, de leurs propriétés et de leurs contraintes
### Le candidat 
Le candidat est celui qui créer son CV. 
Il est caractérisé par : 
-un identifiant 
-un mot de passe 
-son nom 
-son prénom 
-et son adresse e-mail. 

Le candidat possède un et un seul CV. 

###Le CV 
Il est créé par un candidat et peut être consulté par toute personne sur l'application. 
Il se caratérise par : 
-un titre
-une langue : français ou anglais 
-un statut : activé, confidentiel ou désactivé
-une date de création 
-une date de modification

Un CV n'appartient qu'à un et un seul candidat. 

### Le référant 
Il s'agit du référant d'un candidat. 
Il est caractérisé par son nom et son prénom.
Un candidat peut avoir un ou plusieurs référant, nous faisons l'hypothèse qu'il peut ne pas en avoir. 
Nous faisons également l'hypothèse que le référant d'un candidat peut être candidat lui-même.

### La publication 
Un candidat peut faire une publication. Celle-ci est caractérisée par : 
-un ISBN
-un titre 
-une date (de publication)
-un contenu 

Seul un candidat a des publications. Un candidat peut avoir aucune, une ou plusieurs publications.

### Une page WEB 
Un candidat peut avoir une page web caractérisée par :
-une URL 
-un type : professionnelle ou personnelle. 
Un candidat peut ne pas voir de page web, ou en avoir 1 ou plusieurs. 
Seul les candidats peuvent renseigner leur page web. 

### Un téléphone 
Il s'agit d'une information de contact d'un candidat caractérisée par : 
-un numéro 
-un type de téléphone défini comme suit : 
    fixe_perso : il s'agit d'un téléphone fixe personnel 
    port_perso : il s'agit d'un téléphone portable personnel
    fixe_pro : il s'agit d'un téléphone fixe professionnel 
    port_pro : il s'agit d'un téléphone portable professionnel
    
Un candidat doit avoir au moins un téléphone, et il peut en avoir plusieurs. 
Seul un candidat renseigne son téléphone. 

### L'association 
Les candidats peuvent avoir une vie associative présentée par une association caractérisée par : 
-le nom de l'association 
-la durée pendant laquelle le candidat s'est engagé dans l'association (optionnel)
-le poste qu'occupait le candidat au sein de l'association (optionnel)

Seul un candidat renseigne sa vie associative. Il peut s'être engagé dans aucune, une ou plusieurs associations.

### La formation 
Il s'agit d'une rubrique d'un CV et elle est caractérisée par : 
-un titre 
-un type
-une date de début 
-une date de fin 
-le pays où se situe l'établissement
-la ville où se situe l'établissement

Le candidat renseigne sa ou ses formations, et elle seront présentées à partir du CV. Seul un candidat peut renseigner une formation. Il peut ne pas avoir suivi de formation, ou une ou plusieurs. Plusieurs candidats peuvent avoir suivi la même formation (par exemple : les membres d'une même promotion).

### L'expérience : 
Il s'agit d'une rubrique d'un CV, caractérisée par : 
-un titre de poste
-une date de début 
-une date de fin
-la durée qui est la soustraction entre la date de fin et la date de début 
-une fonction 
-un secteur d'activité 
-le nom de l'entreprise 

Seul un candidat peut renseigner cette rubrique. 
Un candidat peut avoir aucune, une ou plusieurs expériences. On considère que la variété d'expérience est telle (dans une entreprise donnée, pour le même poste il est peu probable que la date de début et de fin soit la même) que plusieurs candidats ne peuvent avori exactement la même expérience. Ainsi, plusieurs CV ne peuvent pas répertorier exactement la même expérience. 

### La compétence 
Il s'agit aussi d'une rubrique d'un CV caractérisée par : 
-le nom de la compétence

Seul un candidat peut renseigner une compétence. 
Plusieurs candidats peuvent avoir la même compétence, donc plusieurs CV peuvent contenir plusieurs même compétence. 
 
### La langue 
Il s'agit d'une rubrique d'un CV caractérisée par : 
-la langue 
-le niveau de maîtrise 
 
Seul un candidat peut renseigner cette rubrique. 
Plusieurs candidats peuvent maitriser plus langues aves le même niveau, donc plusieurs CV peuvent répertorier plus même langues avec les même niveau. 

### Les informations complémentaires : 
Il s'agit d'une rubrique d'un CV caractérisée par : 
-le permis : oui, non 
-vehicule : oui, non 

Seul un candidat peut renseigner cette rubrique. 
Un candidat peut avoir aucune ou une rubrique informations complémentaires. Plusieurs candidats peuvent avoir les même informations complémentaires donc plusieur CV peuvent contenir les mêmes informations complémentaires. 

## Les utilisateurs de l'application 

### Les candidats 
Ils pourront créer l'ensemble des informations qui les caractérisent, et peuvent modifier ou supprimer certaines informations. 

### Tout individu 
Toute personne ayant accès à l'application pourra visualiser les informations de tous les candidats de la base de données. 
Ils pourront gérer les candidats en fonction de certains critères de leur choix (par exemple : la liste des candidats ayant comme compétence base de données).
Ils pourront également avoir accès à des statistiques (par exemple : le nombre de candidats par domaine d'étude). 


