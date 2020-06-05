SELECT COUNT (*) 
FROM formation 
WHERE type_formation='master' 

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='bachelor'

SELECT COUNT (*) 
FROM formation 
WHERE type_formation='BTS'

//sélection de la compétence commmunication -> à remplacer par base de données
SELECT (CV.IDCV)
FROM asso_comp,CV,competence
WHERE competence.nom = 'communication' AND asso_comp.competence = competence.nom AND asso_comp.cv = CV.IDCV
