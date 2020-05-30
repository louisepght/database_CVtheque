-- Database: cvtheque

-- DROP DATABASE cvtheque;

CREATE DATABASE cvtheque
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE candidat(
    identifiant VARCHAR,
    mot_de_passe VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    e_mail  VARCHAR NOT NULL,
    cv INTEGER NOT NULL REFERENCES CV(IDCV),
    UNIQUE(cv),
    PRIMARY KEY(identifiant)
);


CREATE TABLE CV(
    IDCV INTEGER,
    titre VARCHAR NOT NULL,
    langue VARCHAR NOT NULL,
    statut VARCHAR NOT NULL,
    date_crea DATE NOT NULL,
    date_modif DATE NOT NULL,
    info_CV INTEGER REFERENCES info_complementaire(IDINFO),
    PRIMARY KEY(IDCV),
    CHECK(langue IN ('francais', 'anglais')),
    CHECK(statut IN ('activé','confidentiel','désactivé'))
);

CREATE TABLE referant(
    nom_entreprise VARCHAR,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    candidat INTEGER NOT NULL,
    PRIMARY KEY(nom_entreprise),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant),
    UNIQUE(candidat)
);

CREATE TABLE publication(
    ISBN INTEGER,
    titre VARCHAR NOT NULL,
    date DATETIME NOT NULL,
    contenu VARCHAR NOT NULL,
    candidat INTEGER NOT NULL,
    PRIMARY KEY(ISBN),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant),
    UNIQUE(candidat),
    CHECK (LENGTH(ISBN)=10 OR LENGTH(ISBN)=13)
);

CREATE TABLE web(
    URL VARCHAR,
    type_web VARCHAR NOT NULL,
    candidat INTEGER NOT NULL,
    PRIMARY KEY(URL),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant),
    UNIQUE(candidat),
    CHECK (type_web IN ('personnelle','professionnelle')),
    CHECK (SUBSTR(URL,1,8) ='https://')
);

CREATE TABLE telephone(
    numero VARCHAR(10),   
    type_tel VARCHAR,
    candidat INTEGER,
    PRIMARY KEY(numero),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant),
    UNIQUE(candidat),
    CHECK(type_tel IN ('port_perso','port_pro','fixe_perso','fixe_pro'))
);

CREATE TABLE experience(
    nom_entreprise VARCHAR,
    titre_poste VARCHAR NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    fonction VARCHAR NOT NULL,
    secteur_act VARCHAR NOT NULL,
    cv INTEGER NOT NULL,
    PRIMARY KEY(nom_entreprise),
    FOREIGN KEY(cv) REFERENCES CV(IDCV),
    UNIQUE (cv)
);

CREATE TABLE info_complementaire(
    IDINFO INTEGER,
    permis VARCHAR,
    vehicule VARCHAR,
    PRIMARY KEY(IDINFO)
);

CREATE TABLE formation(
    titre VARCHAR,
    etablissement VARCHAR,
    type_formation VARCHAR NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    pays VARCHAR NOT NULL,
    ville VARCHAR NOT NULL,
    PRIMARY KEY(titre,etablissement)
);

CREATE TABLE competence(
    nom VARCHAR,
    PRIMARY KEY(nom)
);

CREATE TABLE langue(
    langue VARCHAR,
    PRIMARY KEY(langue)
);

CREATE TABLE association(
    nom VARCHAR,
    duree INTEGER,
    poste VARCHAR,
    PRIMARY KEY(nom)
);

CREATE TABLE vie_associative(
    association VARCHAR,
    candidat INTEGER,
    FOREIGN KEY (association) REFERENCES association(nom),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant)
);

CREATE TABLE niveau(
    langue VARCHAR,
    cv INTEGER,
    niveau VARCHAR NOT NULL,
    FOREIGN KEY (langue) REFERENCES langue,
    FOREIGN KEY (cv) REFERENCES CV(IDCV)
);

CREATE TABLE asso_comp(
    competence VARCHAR,
    cv INTEGER,
    FOREIGN KEY(competence) REFERENCES competence(nom),
    FOREIGN KEY (cv) REFERENCES CV(IDCV)
);

CREATE TABLE asso_formation(
    formation VARCHAR,
    cv INTEGER,
    FOREIGN KEY (formation) REFERENCES formation,
    FOREIGN KEY (cv) REFERENCES CV(IDCV)
);












