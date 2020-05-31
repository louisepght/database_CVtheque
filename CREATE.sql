CREATE TABLE info_complementaire(
    IDINFO INTEGER,
    permis VARCHAR,
    vehicule VARCHAR,
    PRIMARY KEY(IDINFO),
    CHECK (permis IN ('oui','non')),
    CHECK (vehicule IN ('oui','non'))
);

CREATE TABLE formation(
    titre VARCHAR NOT NULL,
    etablissement VARCHAR UNIQUE NOT NULL,
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

CREATE TABLE candidat(
    identifiant VARCHAR,
    mot_de_passe VARCHAR NOT NULL,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    e_mail  VARCHAR NOT NULL,
    cv INTEGER NOT NULL REFERENCES CV(IDCV),
    UNIQUE(cv,e_mail,mot_de_passe),
    PRIMARY KEY(identifiant)
);


CREATE TABLE referant(
    nom_entreprise VARCHAR,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    candidat VARCHAR NOT NULL REFERENCES candidat(identifiant),
    PRIMARY KEY(nom_entreprise),
    UNIQUE(candidat)
);

CREATE TABLE publication(
    ISBN INTEGER,
    titre VARCHAR NOT NULL,
    date_publication DATE NOT NULL,
    contenu VARCHAR NOT NULL,
    candidat VARCHAR NOT NULL REFERENCES candidat(identifiant),
    PRIMARY KEY(ISBN),
    UNIQUE(candidat)
);

CREATE TABLE web(
    URL VARCHAR,
    type_web VARCHAR NOT NULL,
    candidat VARCHAR NOT NULL REFERENCES candidat(identifiant), 
    PRIMARY KEY(URL),
    UNIQUE(candidat),
    CHECK (type_web IN ('personnelle','professionnelle')),
    CHECK (SUBSTR(URL,1,8) ='https://')
);

CREATE TABLE telephone(
    numero VARCHAR(10),   
    type_tel VARCHAR NOT NULL,
    candidat VARCHAR NOT NULL REFERENCES candidat(identifiant),
    PRIMARY KEY(numero),
REFERENCES candidat(identifiant),
    CHECK(type_tel IN ('port_perso','port_pro','fixe_perso','fixe_pro'))
);

CREATE TABLE experience(
    nom_entreprise VARCHAR,
    titre_poste VARCHAR NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    fonction VARCHAR NOT NULL,
    secteur_act VARCHAR NOT NULL,
    cv INTEGER NOT NULL REFERENCES CV(IDCV),
    PRIMARY KEY(nom_entreprise),
    UNIQUE (cv)
);


CREATE TABLE vie_associative(
    association VARCHAR,
    candidat VARCHAR,
    FOREIGN KEY (association) REFERENCES association(nom),
    FOREIGN KEY(candidat) REFERENCES candidat(identifiant)
);

CREATE TABLE niveau(
    langue VARCHAR NOT NULL,
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
    formation VARCHAR NOT NULL,
    cv INTEGER NOT NULL,
    UNIQUE(formation,cv),
    FOREIGN KEY (formation) REFERENCES formation(etablissement),
    FOREIGN KEY (cv) REFERENCES CV(IDCV)
);








