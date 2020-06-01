INSERT INTO info_complementaire
VALUES('1234','oui','non'),
('2345','oui','non'),
('3456','non','oui');

INSERT INTO formation
VALUES('Ingénieur informatique','UTC','master','01/09/2020','30/06/2025','France','compiègne'),
('Ingénieur informatique','UTT','master','01/09/2020','30/06/2025','France','Troyes');

INSERT INTO competence
VALUES('communication'),
('gestion de projet');

INSERT INTO langue
VALUES('anglais'),
('allemand'),
('espagnol');

INSERT INTO association
VALUES('toit pour le nepal','2','resp com'),
('skiut','1','tresorier');

INSERT INTO CV
VALUES('0101','rechrche emploi','francais','désactivé','01/05/2019','03/05/2019','1234'),
('0102','recherche emploi','anglais','activé','01/05/2019','03/05/2019','2345'),
('0103','recherche stage','anglais','confidentiel','01/05/2019','03/05/2019','2345');

INSERT INTO candidat
VALUES('louiselog','mdplouise','poughet','louise','louise.poughet@gmail.com','0101'),
('thibaultlog','mdpthibault','duval','thibault','thibault@gmail.com','0102'),
('paulinelog','mdppauline','dupont','pauline','pauline@gmail.com','0103');

INSERT INTO referant
VALUES('AMIS','francois','duval','louiselog'),
('safran','amelie','dupont','thibaultlog')
;

INSERT INTO web
VALUES('https://mywebsite','personnelle','louiselog'),
('https://mywebsite2','professionnelle','paulinelog');

INSERT INTO telephone
VALUES('0602030405','port_perso','louiselog'),
('0602030404','port_pro','paulinelog'),
('0602030406','fixe_perso','paulinelog'),
('0602030407','fixe_pro','paulinelog');

INSERT INTO experience
VALUES('AMIS','stage opérateur','01/02/2019','30/03/2019','ouvrier','siderurgie','0101'),
('valeo','chef de projet','01/02/2000','30/03/2010','qualite','equipementier','0102');

INSERT INTO vie_associative
VALUES('toit pour le nepal','louiselog'),
('skiut','paulinelog');

INSERT INTO niveau
VALUES('anglais','0101 ','courant'),
('allemand','0103 ','bilingue');

INSERT INTO asso_comp
VALUES('communication','0101'),
('gestion de projet','0102');

INSERT INTO asso_formation
VALUES('UTC','Ingénieur informatique','0101'),
('UTT','Ingénieur informatique','0102');


