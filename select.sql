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
SELECT EXTRACT(YEAR FROM experience.date_fin) - EXTRACT(YEAR FROM experience.date_debut) AS duree, experience.cv
FROM experience
--WHERE duree>5



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























