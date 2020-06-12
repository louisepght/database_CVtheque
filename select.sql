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
CREATE VIEW parcours
(nombre_experience, cv, nom, prenom, identifiant, diplome, postes, langue)
AS SELECT COUNT(*) as nombre, asso_exp.cv, candidat.nom, candidat.prenom, candidat.identifiant, asso_formation.formation_titre, asso_exp.titre_poste, niveau.langue
FROM asso_exp, CV, candidat, niveau,asso_formation
WHERE CV.IDCV=asso_exp.cv AND candidat.cv=CV.IDCV AND niveau.cv=CV.IDCV AND asso_formation.cv=CV.IDCV
GROUP BY asso_exp.cv, candidat.nom, candidat.prenom, candidat.identifiant, asso_formation.formation_titre, asso_exp.titre_poste, niveau.langue

---------------------------------------------------------------

--la recherche multicritères des candidats en fonction 
--	du nombre d'expériences professionnelles,  
--	de l'année d'obtention de diplôme, 
--	du poste souhaité. 
-------Poste souhaité------------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_exp JOIN CV ON asso_exp.cv=CV.IDCV
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_exp.titre_poste='chef de projet'
-------------------------------------

--------Année d'obtention du diplome-----------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_formation
JOIN CV ON CV.IDCV=asso_formation.cv
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_formation.date_fin='2025-06-30' 
-------------------------------------

--------Année d'obtention du diplome-----------------------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM asso_formation 
JOIN CV ON CV.IDCV=asso_formation.cv
JOIN candidat ON candidat.cv=CV.IDCV
WHERE asso_formation.date_fin='2021-06-30'
-------------------------------------

---------Nombre d'expérience----------------------------
CREATE VIEW information_candidat
(nombre_experience, cv, nom, prenom, identifiant)
AS SELECT COUNT(*) as nombre, asso_exp.cv, candidat.nom, candidat.prenom, candidat.identifiant
FROM asso_exp, CV, candidat 
WHERE CV.IDCV=asso_exp.cv AND candidat.cv=CV.IDCV
GROUP BY asso_exp.cv, candidat.nom, candidat.prenom, candidat.identifiant
-------------------------------------

























