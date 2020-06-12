INSERT INTO info_complementaire
VALUES('1234','A1','non'),
('2345','B1','oui'),
('3456','B1','oui');

INSERT INTO formation
VALUES('Ingénieur informatique','UTC','master','France','compiègne'),
('Ingénieur informatique','UTT','master','France','Troyes'),
('Designer industriel','UTC','master','France','compiègne'),
('Designer industriel','UTC','master','France','compiègne')
;

INSERT INTO competence
VALUES('communication'),
('gestion de projet'),
('base de donnees');

INSERT INTO langue
VALUES('anglais'),
('allemand'),
('espagnol');

INSERT INTO association
VALUES('toit pour le nepal'),
('skiut'),
('EPI');

INSERT INTO CV
VALUES('0101','rechrche emploi','francais','désactivé','01/05/2019','03/05/2019','1234'),
('0102','recherche emploi','anglais','activé','01/05/2019','03/05/2019','2345'),
('0103','recherche stage','anglais','confidentiel','01/05/2019','03/05/2019','3456'),
('0104','recherche emploi','francais','confidentiel','02/08/2018','06/06/2020','4567')
;

INSERT INTO candidat
VALUES('louiselog','mdplouise','poughet','louise','louise.poughet@gmail.com','0101'),
('thibaultlog','mdpthibault','duval','thibault','thibault@gmail.com','0102'),
('paulinelog','mdppauline','dupont','pauline','pauline@gmail.com','0103'),
('maximelog','mdpmaxime','lejeune','maxime','maxime@gmail.com','0104');

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
('0602030407','fixe_pro','paulinelog'),
('0602030408','port_pro','maximelog')
;

INSERT INTO experience
VALUES('AMIS','siderurgie'),
('valeo','chef de projet','01/02/2000','30/03/2010','qualite','equipementier','0102'),
('schneider','electronique'),
('airliquide','gaz'),
('airliquide','gaz')
;

INSERT INTO asso_exp 
VALUES ('stage opérateur','01/02/2019','30/03/2019','ouvrier','0101'),
('assistant chef de projet','20/06/1995','10/09/1999','controle','0102'),
('stage ingénieur','01/02/1994','30/06/1994','BE','0102'),
('stage ingénieur','01/02/2018','30/06/2018','BE','0104');


INSERT INTO vie_associative
VALUES('toit pour le nepal','louiselog','20/04/2013','20/04/2014','tresorier'),
('skiut','paulinelog','20/04/2013','20/04/2015','resp com'),
('skiut','louiselog','20/04/2015','20/04/2016','resp com')
;

INSERT INTO niveau
VALUES('anglais','0101 ','courant'),
('allemand','0103 ','bilingue'),
('anglais','0103 ','bilingue'),
('espagnol','0103 ','scolaire')
;

INSERT INTO asso_comp
VALUES('communication','0101'),
('gestion de projet','0102'),
('communication','0103'),
('gestion de projet','0103'),
('base de donnees','0102'),
('base de donnees','0101');

INSERT INTO asso_formation
VALUES('UTC','Ingénieur informatique','0101','01/09/2020','30/06/2025'),
('UTT','Ingénieur informatique','0102','01/09/2020','30/06/2025'),
('UTC','Designer industriel','0103','01/09/2018','30/06/2021'),
('UTC','Designer industriel','0104','01/09/2017','30/06/2020');




