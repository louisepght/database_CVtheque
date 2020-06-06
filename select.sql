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
SELECT (CV.IDCV, candidat.nom, candidat.prenom)
FROM asso_comp,CV,competence,candidat
WHERE competence.nom = 'communication' AND asso_comp.competence = competence.nom AND asso_comp.cv = CV.IDCV AND candidat.cv=CV.IDCV

--compétence BDD et 5 ans d'expérience 
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
SELECT candidat.nom, candidat.prenom, candidat.identifiant, asso_formation.titre, experience.titre_poste,niveau.langue, COUNT(experience.titre_poste)
FROM candidat
JOIN asso_formation ON candidat.cv=asso_formation.cv
JOIN experience ON experience.cv=asso_formation.cv
JOIN niveau ON niveau.cv=experience.cv


--la recherche multicritères des candidats en fonction 
--	du nombre d'expériences professionnelles, 
--	de l'année d'obtention de dernier diplôme, 
--	du poste souhaité.
-----fontionne------------
SELECT candidat.nom, candidat.prenom, candidat.identifiant, CV.IDCV
FROM experience JOIN CV ON experience.cv=CV.IDCV
JOIN candidat ON candidat.cv=CV.IDCV
WHERE experience.titre_poste='chef de projet'
-------------------------------------

------petit morceau qui fonctionne------
SELECT *
FROM formation JOIN asso_formation 
ON (etablissement,titre)=(formation_etablissement,formation_titre)
WHERE formation.date_fin='2025-06-30' 
-------------------------------------























