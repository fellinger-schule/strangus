INSERT INTO BEREICH (ID, NAME) VALUES (0,'PFANNE1');
INSERT INTO BEREICH (ID, NAME) VALUES (1,'PFANNE2');
INSERT INTO BEREICH (ID, NAME) VALUES (2,'VERTEILER1');
INSERT INTO BEREICH (ID, NAME) VALUES (3,'VERTEILER2');
INSERT INTO BEREICH (ID, NAME) VALUES (4,'KOKILLE1');
INSERT INTO BEREICH (ID, NAME) VALUES (5,'KOKILLE2');

INSERT INTO VERTEILER (ID, AGE) VALUES (0, 64);
INSERT INTO VERTEILER (ID, AGE) VALUES (1, 128);
INSERT INTO VERTEILER (ID, AGE) VALUES (2, 256);
INSERT INTO VERTEILER (ID, AGE) VALUES (3, 512);
INSERT INTO VERTEILER (ID, AGE) VALUES (4, 1024);

INSERT INTO PFANNE (ID, AGE) VALUES (0, 64);
INSERT INTO PFANNE (ID, AGE) VALUES (1, 128);
INSERT INTO PFANNE (ID, AGE) VALUES (2, 256);
INSERT INTO PFANNE (ID, AGE) VALUES (3, 512);
INSERT INTO PFANNE (ID, AGE) VALUES (4, 1024);

INSERT INTO KOKILLE (ID, AGE) VALUES (0, 64);
INSERT INTO KOKILLE (ID, AGE) VALUES (1, 128);
INSERT INTO KOKILLE (ID, AGE) VALUES (2, 256);
INSERT INTO KOKILLE (ID, AGE) VALUES (3, 512);
INSERT INTO KOKILLE (ID, AGE) VALUES (4, 1024);

INSERT INTO PARAMETER (ID, NAME, DEFAULT_VALUE, TEXT_NUMBER, EINHEIT, MESSZEITPUNKT, OBERGRENZE, UNTERGRENZE, BEREICH_ID)
            VALUES (0, 'Temperatur Verteiler 1', 0, 0, 'C', CURRENT_DATE, 0, 5000, 2);
INSERT INTO PARAMETER (ID, NAME, DEFAULT_VALUE, TEXT_NUMBER, EINHEIT, MESSZEITPUNKT, OBERGRENZE, UNTERGRENZE, BEREICH_ID)
            VALUES (1, 'Temperatur Verteiler 2', 0, 0, 'C', CURRENT_DATE, 0, 5000, 3);
INSERT INTO PARAMETER (ID, NAME, DEFAULT_VALUE, TEXT_NUMBER, EINHEIT, MESSZEITPUNKT, OBERGRENZE, UNTERGRENZE, BEREICH_ID)
            VALUES (2, 'Geschwindigkeit Strang 1', 0, 0, 'm/s', CURRENT_DATE, 0, 10, 4);
INSERT INTO PARAMETER (ID, NAME, DEFAULT_VALUE, TEXT_NUMBER, EINHEIT, MESSZEITPUNKT, OBERGRENZE, UNTERGRENZE, BEREICH_ID)
            VALUES (3, 'Geschwindigkeit Strang 2', 0, 0, 'm/s', CURRENT_DATE, 0, 10, 4);
INSERT INTO PARAMETER (ID, NAME, DEFAULT_VALUE, TEXT_NUMBER, EINHEIT, MESSZEITPUNKT, OBERGRENZE, UNTERGRENZE, BEREICH_ID)
            VALUES (4, 'Gie�pulver Kokille 1', 0, 1, '', CURRENT_DATE, 0, 10, 4);
            
INSERT INTO TEXT_PARAM (PARAM_ID,EQUIVALENTNUMBER, TEXT) VALUES (4, 0, 'Schwarz');
INSERT INTO TEXT_PARAM (PARAM_ID,EQUIVALENTNUMBER, TEXT) VALUES (4, 1, 'Rot');
INSERT INTO TEXT_PARAM (PARAM_ID,EQUIVALENTNUMBER, TEXT) VALUES (4, 2, 'Wei�');
INSERT INTO TEXT_PARAM (PARAM_ID,EQUIVALENTNUMBER, TEXT) VALUES (4, 3, 'Gr�n');
INSERT INTO TEXT_PARAM (PARAM_ID,EQUIVALENTNUMBER, TEXT) VALUES (4, 4, 'Braun');

INSERT INTO PRODUKT (ID, NAME) VALUES (0, 'Waschmaschine');
INSERT INTO PRODUKT (ID, NAME) VALUES (1, 'Autokarosserie');
INSERT INTO PRODUKT (ID, NAME) VALUES (2, 'Zugschiene');
INSERT INTO PRODUKT (ID, NAME) VALUES (3, 'Kanaldeckel');
INSERT INTO PRODUKT (ID, NAME) VALUES (4, 'Billigeisenskulptur');


INSERT INTO EZV (ID, NAME, PRODUKT_ID) VALUES (0, 'Waschmaschinenblech', 0);
INSERT INTO EZV (ID, NAME, PRODUKT_ID) VALUES (1, 'Autoblech', 1);
INSERT INTO EZV (ID, NAME, PRODUKT_ID) VALUES (2, 'Schieneneisen', 2);
INSERT INTO EZV (ID, NAME, PRODUKT_ID) VALUES (3, 'Kanaldeckeleisen', 3);
INSERT INTO EZV (ID, NAME, PRODUKT_ID) VALUES (4, 'Billigeisen', 4);

INSERT INTO EZV_PARAM_MAPPING (ID, EZV_ID, PARAMETER_ID, MIN, AIM, MAX) VALUES (0, 0,0, 2000,2500,3000);
INSERT INTO EZV_PARAM_MAPPING (ID, EZV_ID, PARAMETER_ID, MIN, AIM, MAX) VALUES (1, 1,1, 2000,2500,3000);
INSERT INTO EZV_PARAM_MAPPING (ID, EZV_ID, PARAMETER_ID, MIN, AIM, MAX) VALUES (2, 2,2, 3,4,5);
INSERT INTO EZV_PARAM_MAPPING (ID, EZV_ID, PARAMETER_ID, MIN, AIM, MAX) VALUES (3, 3,3, 3,5,9);
INSERT INTO EZV_PARAM_MAPPING (ID, EZV_ID, PARAMETER_ID, MIN, AIM, MAX) VALUES (4, 4,4, 0,0,0);

INSERT INTO CHARGE(ID, EZV_ID, NAME, VERTEILER_ID, PFANNE_ID, KOKILLE_ID) VALUES (0,0,'Charge0', 0,1,2);
INSERT INTO CHARGE(ID, EZV_ID, NAME, VERTEILER_ID, PFANNE_ID, KOKILLE_ID) VALUES (1,1,'Charge1', 1,1,2);
INSERT INTO CHARGE(ID, EZV_ID, NAME, VERTEILER_ID, PFANNE_ID, KOKILLE_ID) VALUES (2,2,'Charge2', 0,4,2);
INSERT INTO CHARGE(ID, EZV_ID, NAME, VERTEILER_ID, PFANNE_ID, KOKILLE_ID) VALUES (3,3,'Charge3', 2,1,2);
INSERT INTO CHARGE(ID, EZV_ID, NAME, VERTEILER_ID, PFANNE_ID, KOKILLE_ID) VALUES (4,4,'Charge4', 1,1,3);
