

DROP TABLE IF EXISTS abonnement;
DROP TABLE IF EXISTS membre;

CREATE TABLE membre (
                         id               INT          NOT NULL AUTO_INCREMENT,
                         nom              VARCHAR(50)  NOT NULL,
                         prenom           VARCHAR(50)  NOT NULL,
                         telephone        VARCHAR(20)  NOT NULL,
                         email            VARCHAR(100) NOT NULL UNIQUE,
                         date_inscription DATE         NOT NULL DEFAULT (CURRENT_DATE),
                         CONSTRAINT pk_membres PRIMARY KEY (id)
);

CREATE TABLE abonnement (
                             id               INT          NOT NULL AUTO_INCREMENT,
                             membre_id        INT          NOT NULL,
                             type_abonnement  ENUM('Mensuel','Trimestriel','Annuel') NOT NULL,
                             date_debut       DATE         NOT NULL,
                             date_fin         DATE         NOT NULL,
                             statut           ENUM('Actif','Expiré','Suspendu') NOT NULL DEFAULT 'Actif',
                             CONSTRAINT pk_abonnements PRIMARY KEY (id),
                             CONSTRAINT fk_membre FOREIGN KEY (membre_id)
                                 REFERENCES membres(id)
                                 ON DELETE CASCADE
                                 ON UPDATE CASCADE,
                             CONSTRAINT chk_dates CHECK (date_fin > date_debut)
) ;