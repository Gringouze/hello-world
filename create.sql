CREATE TABLE ADHERENT(
   IDUSER NUMBER(7),
   LOGINUSER VARCHAR2(15) NOT NULL UNIQUE,
   PASSUSER VARCHAR2(15) NOT NULL,
   PHOTOUSER VARCHAR2(250),
   PRENOMUSER VARCHAR2(15) NOT NULL,
   NOMUSER VARCHAR2(15) NOT NULL,
   MAILUSER VARCHAR2(30),
   PHONEUSER VARCHAR2(10) NOT NULL,
   VILLEUSER VARCHAR2(25) NOT NULL,
   CPUSER VARCHAR2(5) NOT NULL,
   ADDRUSER VARCHAR2(50) NOT NULL,
   INFOUSER VARCHAR2(4000),
   ADMINUSER NUMBER(1) NOT NULL,
   DCOTISUSER DATE,
   PRIMARY KEY(IDUSER)
);
CREATE TABLE Article(
   IDART NUMBER(7),
   DART DATE NOT NULL,
   TXTART VARCHAR2(4000) NOT NULL,
   HMPGART NUMBER(1) NOT NULL,
   IDUSER NUMBER(7) NOT NULL,
   PRIMARY KEY(IDART)   
);
CREATE TABLE Photo(
   IDPHOT NUMBER(7),
   LINKPHOT VARCHAR2(250) NOT NULL,
   LBLPHOT VARCHAR2(50) NOT NULL,
   IDUSER NUMBER(7) NOT NULL,
   PRIMARY KEY(IDPHOT)
);
CREATE TABLE ACTIVITE(
   IDACT NUMBER(7),
   DCREAACT DATE NOT NULL,
   LBLACT VARCHAR2(100) NOT NULL,
   STARTACT DATE NOT NULL,
   ENDACT DATE NOT NULL,
   TARIFACT NUMBER(5,2) NOT NULL,
   TARIFINVITACT NUMBER(5,2) NOT NULL,
   PHONERESPACT VARCHAR2(10) NOT NULL,
   NOMRESPACT VARCHAR2(35) NOT NULL,
   LIEUSTARTACT VARCHAR2(150) NOT NULL,
   LIEUENDACT VARCHAR2(150) NOT NULL,
   DLIMITINSCRACT DATE NOT NULL,
   INFOACT VARCHAR2(4000) NOT NULL,
   IDUSER NUMBER(7) NOT NULL,
   PRIMARY KEY(IDACT)
);
CREATE TABLE INSCRIPT_ACTIVITE(
   IDACT NUMBER(7),
   IDUSER NUMBER(7),
   DINSCRIPT DATE NOT NULL,
   NBINVITINSCRIPT NUMBER(3) NOT NULL,
   PRIMARY KEY(IDACT, IDUSER)
);
CREATE TABLE PHOTO_ARTICLE(
   IDART NUMBER(7),
   IDPHOT NUMBER(7),
   PRIMARY KEY(IDART, IDPHOT)
);
CREATE TABLE PHOTO_ACTIVITE(
   IDACT NUMBER(7),
   IDPHOT NUMBER(7),
   PRIMARY KEY(IDACT, IDPHOT)
);
ALTER TABLE Article
ADD CONSTRAINT ARTICLE_IDUSER_FK FOREIGN KEY(IDUSER) REFERENCES ADHERENT(IDUSER);
ALTER TABLE Photo
ADD CONSTRAINT PHOTO_IDUSER_FK FOREIGN KEY(IDUSER) REFERENCES ADHERENT(IDUSER);
ALTER TABLE ACTIVITE
ADD CONSTRAINT ACTIVITE_IDUSER_FK FOREIGN KEY(IDUSER) REFERENCES ADHERENT(IDUSER);
ALTER TABLE INSCRIPT_ACTIVITE
ADD CONSTRAINT INSCRIPT_ACTIVITE_IDACT_FK FOREIGN KEY(IDACT) REFERENCES ACTIVITE(IDACT);
ALTER TABLE INSCRIPT_ACTIVITE
ADD CONSTRAINT INSCRIPT_ACTIVITE_IDUSER_FK FOREIGN KEY(IDUSER) REFERENCES ADHERENT(IDUSER);
ALTER TABLE PHOTO_ARTICLE
ADD CONSTRAINT PHOTO_ARTICLE_IDART_FK FOREIGN KEY(IDART) REFERENCES Article(IDART);
ALTER TABLE PHOTO_ARTICLE
ADD CONSTRAINT PHOTO_ARTICLE_IDPHOT_FK FOREIGN KEY(IDPHOT) REFERENCES Photo(IDPHOT);
ALTER TABLE PHOTO_ACTIVITE
ADD CONSTRAINT PHOTO_ACTIVITE_IDACT_FK FOREIGN KEY(IDACT) REFERENCES ACTIVITE(IDACT);
ALTER TABLE PHOTO_ACTIVITE
ADD CONSTRAINT PHOTO_ACTIVITE_IDPHOT_FK FOREIGN KEY(IDPHOT) REFERENCES Photo(IDPHOT);
