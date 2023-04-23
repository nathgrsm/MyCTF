-- Table pour stocker les informations sur les challenges
CREATE TABLE challenges (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque challenge',
  competition_id INT(11) COMMENT 'Identifiant de la compétition à laquelle ce challenge appartient',
  name VARCHAR(255) NOT NULL COMMENT 'Nom du challenge',
  category VARCHAR(255) COMMENT 'Catégorie du challenge',
  description TEXT COMMENT 'Description du challenge',
  points INT(11) COMMENT 'Nombre de points attribués pour résoudre ce challenge',
  flag VARCHAR(255) COMMENT 'Flag (indicateur) qui doit être soumis pour valider le challenge',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table pour stocker les informations sur les compétitions
CREATE TABLE competitions (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque compétition',
  name VARCHAR(255) NOT NULL COMMENT 'Nom de la compétition',
  status INT(11) COMMENT 'Statut de la compétition (par exemple, en cours, terminée)',
  start_date DATE COMMENT 'Date de début de la compétition',
  end_date DATE COMMENT 'Date de fin de la compétition',
  start_time TIME COMMENT 'Heure de début de la compétition',
  end_time TIME COMMENT 'Heure de fin de la compétition',
  location VARCHAR(255) COMMENT 'Lieu où se déroule la compétition',
  description TEXT COMMENT 'Description de la compétition',
  is_online INT(11) COMMENT 'Indique si la compétition est en ligne (1) ou non (0)',
  online_link VARCHAR(255) COMMENT 'Lien vers la compétition en ligne, si elle existe',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table pour stocker les informations sur les écoles participantes
CREATE TABLE schools (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque école',
  name VARCHAR(255) NOT NULL COMMENT 'Nom de l\'école',
  address VARCHAR(255) COMMENT 'Adresse de l\'école',
  city VARCHAR(255) COMMENT 'Ville où se trouve l\'école',
  country VARCHAR(255) COMMENT 'Pays où se trouve l\'école',
  website VARCHAR(255) COMMENT 'Site web de l\'école',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table pour stocker les informations sur les réseaux sociaux
CREATE TABLE social_networks (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque réseau social',
  name VARCHAR(255) NOT NULL COMMENT 'Nom du réseau social',
  url VARCHAR(255) COMMENT 'URL du profil ou de la page du réseau social',
  icon VARCHAR(255) COMMENT 'Chemin vers l\'icône du réseau social',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Table pour stocker les informations sur les sponsors
CREATE TABLE sponsors (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque sponsor',
  name VARCHAR(255) NOT NULL COMMENT 'Nom du sponsor',
  logo VARCHAR(255) COMMENT 'Chemin vers le logo du sponsor',
  website VARCHAR(255) COMMENT 'Site web du sponsor',
  PRIMARY KEY (id)
) ENGINE=InnoDB;
