------Sélection du nombre de type de formation-------------------------------
SELECT COUNT (*) 
FROM formation 
WHERE type_formation='master' 

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='bachelor'

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='BTS'

--sélection de la compétence base de données
--------fontionne ajouter 5 ans d'experience------------
SELECT (CV.IDCV, candidat.nom, candidat.prenom)
FROM CV, candidat, asso_comp
WHERE asso_comp.competence='base de donnees' AND cv.IDCV=asso_comp.cv AND candidat.cv=CV.IDCV

-----------la contrainte sur la durée ne fonctionne pas-------------
SELECT EXTRACT(YEAR FROM experience.date_fin) - EXTRACT(YEAR FROM experience.date_debut) AS duree,CV.IDCV,asso_comp.competence, candidat.identifiant,candidat.prenom, candidat.nom
FROM experience JOIN CV ON experience.cv=CV.IDCV --AND duree>5
JOIN asso_comp ON (asso_comp.cv=CV.IDCV AND asso_comp.competence='base de donnees')
JOIN candidat ON candidat.cv=CV.IDCV


--synthétiser le parcours de chaque candidat en précisant 
--	la liste de ses diplômes, 
--	la liste des postes occupés, 
--	le nombre d'expériences professionnelles acquises, 
--	les langues maîtrisées;
-------fonctionne mais il manque nb expérience------------------
SELECT CV.IDCV, niveau.langue, niveau.niveau, asso_exp.titre_poste,asso_formation.formation_titre
FROM niveau JOIN CV ON niveau.cv=CV.IDCV
JOIN asso_exp ON asso_exp.cv=CV.IDCV 
JOIN asso_formation ON asso_formation.cv=CV.IDCV
---------------------------------------------------------------

--la recherche multicritères des candidats en fonction 
--	du nombre d'expériences professionnelles,  
--	de l'année d'obtention de dernier diplôme, 
--	du poste souhaité. 
-------------------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_exp JOIN CV ON asso_exp.cv=CV.IDCV
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_exp.titre_poste='chef de projet'
-------------------------------------

-------------------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_formation
JOIN CV ON CV.IDCV=asso_formation.cv
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_formation.date_fin='2025-06-30' 
-------------------------------------

-------------------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_formation 
JOIN CV ON CV.IDCV=asso_formation.cv
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_formation.date_fin='2021-06-30'
-------------------------------------


CREATE VIEW information
(nombre experience, identifiant)
AS SELECT COUNT(*) as nombre, asso_exp.cv
FROM asso_exp
GROUP BY cv


-------ébauche nombre d'experience----------
SELECT COUNT (*)
FROM experience
WHERE experience.cv=102

SELECT COUNT (*)
FROM experience
WHERE experience.cv=103

SELECT COUNT (*)
FROM experience
WHERE experience.cv=101
------------------------------------------























