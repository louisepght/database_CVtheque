SELECT COUNT (*) 
FROM formation 
WHERE type_formation='master' 

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='bachelor'

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='BTS'

--sélection de la compétence commmunication -> à remplacer par base de données
--------fontionne ajouter 5 ans d'experience------------
SELECT (CV.IDCV, candidat.nom, candidat.prenom)
FROM asso_comp,CV,competence,candidat
WHERE competence.nom = 'communication' AND asso_comp.competence = competence.nom AND asso_comp.cv = CV.IDCV AND candidat.cv=CV.IDCV

--compétence BDD et 5 ans d'expérience 
------ne fonctionne pas-------------
SELECT candidat.nom,candidat.prenom,candidat.identifiant, DATEDIFF(year,date_debut,date_fin) as duree
FROM asso_comp 
JOIN experience ON asso_comp.cv=experience.cv
JOIN candidat ON experience.cv=candidat.cv
WHERE asso_comp.competence='base de données' AND duree>5

--synthétiser le parcours de chaque candidat en précisant 
--	la liste de ses diplômes, 
--	la liste des postes occupés, 
--	le nombre d'expériences professionnelles acquises, 
--	les langues maîtrisées;
-------fonctionne mais il manque nb expérience------------------
SELECT CV.IDCV, niveau.langue, niveau.niveau, experience.titre_poste,asso_formation.formation_titre
FROM niveau JOIN CV ON niveau.cv=CV.IDCV
JOIN experience ON experience.cv=CV.IDCV 
JOIN asso_formation ON asso_formation.cv=CV.IDCV
---------------------------------------------------------------




--la recherche multicritères des candidats en fonction 
--	du nombre d'expériences professionnelles,  
--	de l'année d'obtention de dernier diplôme, OK
--	du poste souhaité.  OK
-----fontionne------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM experience JOIN CV ON experience.cv=CV.IDCV
JOIN candidat ON candidat.cv=CV.IDCV
WHERE experience.titre_poste='chef de projet'
-------------------------------------

------------fonctionne-------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM formation JOIN asso_formation 
ON (etablissement,titre)=(formation_etablissement,formation_titre)
JOIN CV ON CV.IDCV=asso_formation.cv
JOIN candidat ON candidat.cv=CV.IDCV
WHERE formation.date_fin='2025-06-30' 
-------------------------------------

-------ébauche nombre d'experience----------
SELECT COUNT (*)
FROM experience
WHERE experience.cv=102
------------------------------------------























