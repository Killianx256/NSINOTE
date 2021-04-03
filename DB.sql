
CREATE TABLE Type (
	idType INTEGER PRIMARY KEY AUTO_INCREMENT,
	nomType VARCHAR(42)
);

CREATE TABLE Trimestre (
	nTrimestre INTEGER PRIMARY KEY AUTO_INCREMENT,
	description VARCHAR(42)
);

CREATE TABLE Matiere(
	idM INTEGER PRIMARY KEY AUTO_INCREMENT,
	nomMatiere VARCHAR(42)
);






CREATE TABLE Utilisateur(
	idU INTEGER PRIMARY KEY AUTO_INCREMENT,
	idType INTEGER,
	MDP VARCHAR(42),
	FOREIGN KEY (idType) REFERENCES Type(idType)
);

CREATE TABLE Professeur (
	idPr INTEGER PRIMARY KEY AUTO_INCREMENT,
	idU INTEGER, 
	nom VARCHAR(42),
	prenom VARCHAR(42),
	telephone INTEGER,
	adresse VARCHAR(42),
	FOREIGN KEY (idU) REFERENCES Utilisateur(idU)
);

CREATE TABLE CPE (
	idCPE INTEGER PRIMARY KEY AUTO_INCREMENT,
	idU INTEGER,
	prenom VARCHAR (42),
	nom VARCHAR (42),
	telephone VARCHAR (42),
	adresse VARCHAR (42),
	FOREIGN KEY (idU) REFERENCES Utilisateur(idU)
);

CREATE TABLE Parent (
	idPa INTEGER PRIMARY KEY AUTO_INCREMENT,
	prenom VARCHAR(42),
	nom VARCHAR(42),
	profession VARCHAR(42),
	adresse VARCHAR(42),
	telephone VARCHAR(42),
	idU INTEGER,
	FOREIGN KEY (idU) REFERENCES Utilisateur (idU)
);

CREATE TABLE Classe (
	idClasse INTEGER PRIMARY KEY AUTO_INCREMENT,
	idProfesseurPrincipal INTEGER,
	idCPE INTEGER,
	FOREIGN KEY (idProfesseurPrincipal) REFERENCES Professeur (idPr),
	FOREIGN KEY (idCPE) REFERENCES CPE (idCPE)
);

CREATE TABLE Cours (
	idCo INTEGER PRIMARY KEY AUTO_INCREMENT,
	idPr INTEGER,
	idClasse INTEGER,
	idM INTEGER,
	heure VARCHAR (42),
	salle  VARCHAR (42),
	FOREIGN KEY (idPr) REFERENCES Professeur(idPr),
	FOREIGN KEY (idClasse) REFERENCES Classe(idClasse),
	FOREIGN KEY (idM) REFERENCES Matiere(idM)
);







CREATE TABLE Devoir (
	idD INTEGER PRIMARY KEY AUTO_INCREMENT,
	idCo INTEGER,
	nTrimestre INTEGER,
	corrige BOOLEAN,
	coeff INTEGER, 
	noteMax INTEGER,
	FOREIGN KEY (idCo) REFERENCES Cours(idCo),
	FOREIGN KEY (nTrimestre) REFERENCES Trimestre(nTrimestre)
);


CREATE TABLE Eleve(
	idE INTEGER PRIMARY KEY AUTO_INCREMENT,
	responsable1 INTEGER,
	responsable2 INTEGER,
	idU INTEGER,
	idClasse INTEGER,
	prenom VARCHAR(42),
	nom VARCHAR(42),
	adresse VARCHAR(42),
	telephone VARCHAR(42),
	FOREIGN KEY (responsable1) REFERENCES Parent(idPa),
	FOREIGN KEY (responsable2) REFERENCES Parent(idPa),
	FOREIGN KEY (idU) REFERENCES Utilisateur(idU),
	FOREIGN KEY (idClasse) REFERENCES Classe(idClasse)
);

CREATE TABLE Note (
	idN INTEGER PRIMARY KEY AUTO_INCREMENT, 
	idD INTEGER, 
	idE INTEGER,
	note INTEGER,
	FOREIGN KEY (idD) REFERENCES Devoir(idD),
	FOREIGN KEY (idE) REFERENCES Eleve (idE)
);

CREATE TABLE Bulletin (
	idB INTEGER PRIMARY KEY AUTO_INCREMENT,
	idE INTEGER,
	nTrimestre INTEGER, 
	FOREIGN KEY (idE) REFERENCES Eleve (idE),
	FOREIGN KEY (nTrimestre) REFERENCES Trimestre (nTrimestre)
);

CREATE TABLE Appreciation(
	idA  INTEGER PRIMARY KEY AUTO_INCREMENT,
	texteAppreciation VARCHAR(256),
	idType INTEGER,
	idB INTEGER,
	FOREIGN KEY (idType) REFERENCES Type(idType),
	FOREIGN KEY (idB) REFERENCES Bulletin(idB)
);



