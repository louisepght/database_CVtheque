CREATE TABLE candidat(
    identifiant VARCHAR
    mot_de_passe VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    e_mail  VARCHAR NOT NULL,
    cv INTEGER NOT NULL REFERENECES CV(IDCV),
    UNIQUE (cv),
    PRIMARY KEY(identifiant),
);


CREATE TABLE CV(
    IDCV INTEGER,
    titre VARCHAR NOT NULL,
    langue VARCHAR NOT NULL,
    statut VARCHAR NOT NULL,
    date_crea TIMESTAMP NOT NULL,
    date_modif TIMESTAMP NOT NULL,
    info REFERENCES info_complementaire(IDINFO),
    PRIMARY KEY(IDCV),
    CHECK(langue IN ('francais', 'anglais')),
    CHECK(statut IN ('activé','confidentiel','désactivé')
);

CREATE TABLE referant(
    nom_entreprise VARCHAR
    nom VARCHAR NOT NULL
    prenom VARCHAR NOT NULL
    candidat INTEGER NOT NULL
);

CREATE TABLE publication(
    ISBN INTEGER
    titre VARCHAR NOT NULL
    date DATETIME NOT NULL
    contenu VARCHAR NOT NULL
    candidat INTEGER NOT NULL
);

CREATE TABLE web(
    URL VARCHAR
    type VARCHAR NOT NULL
    candidat INTEGER NOT NULL
);

CREATE TABLE telephone(
    numero VARCHAR(10)      (tel = VARCHAR NOT INTEGER)
    type VARCHAR
    candidat INTEGER
);

CREATE TABLE experience(
    nom_entreprise VARCHAR 
    titre_poste VARCHAR NOT NULL
    date_debut DATETIME NOT NULL
    date_fin DATETIME NOT NULL
    fonction VARCHAR NOT NULL
    secteur_act VARCHAR NOT NULL
    cv INTEGER NOT NULL
);

CREATE TABLE info_complementaire(
    IDINFO INTEGER
    permis VARCHAR
    vehicule VARCHAR
);

CREATE TABLE formation(
    titre VARCHAR
    etablissement VARCHAR
    type VARCHAR NOT NULL
    date_debut DATE NOT NULL
    date_fin DATE NOT NULL
    pays VARCHAR NOT NULL
    ville VARCHAR NOT NULL
    
);

CREATE TABLE competence(
    nom VARCHAR
);

CREATE TABLE langue(
    langue VARCHAR
);

CREATE TABLE association(
    nom VARCHAR
    duree INTEGER
    poste VARCHAR
);

CREATE TABLE vie_associative(
    association VARCHAR
    candidat INTEGER
    
);

CREATE TABLE niveau(
    langue VARCHAR
    cv INTEGER
    niveau VARCHAR NOT NULL
);

CREATE TABLE asso_comp(
    competence VARCHAR
    cv INTEGER
);

CREATE TABLE asso_formation(
    formation VARCHAR
    cv INTEGER
);











