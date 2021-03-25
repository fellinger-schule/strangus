CREATE OR REPLACE PROCEDURE clear_tables IS
BEGIN
    DELETE FROM produkt;
    DELETE FROM charge;
    DELETE FROM charge_anlagenteil_mapping;
    DELETE FROM verteiler;
    DELETE FROM pfanne;
    DELETE FROM kokille;
END clear_tables;
/
CREATE OR REPLACE PROCEDURE mass_insert(p_charge_count number) AS
    v_product_id number;
    v_ezv_id number;
    v_charge_id number;
    v_time TIMESTAMP;
BEGIN
    v_ezv_id := 0;
    v_time := trunc(SYSDATE - interval '2' hour);
    FOR i_chargenum IN 1..p_charge_count LOOP
        SELECT charge_seq.nextval INTO v_charge_id FROM dual;

        --CHARGE
        INSERT INTO CHARGE(ID, EZV_ID, NAME)
        VALUES(v_charge_id, v_ezv_id, 'C_'||i_chargenum);
        
        --PFANNE
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, v_time+numtodsinterval(0,'HOUR'), null, 0, null, null);
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, null, v_time+numtodsinterval(1,'HOUR'), 0, null, null);
        --VERTEILER
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, v_time+numtodsinterval(1,'HOUR'), null, null, 0, null);
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, null, v_time+numtodsinterval(2,'HOUR'), null, 0, null);
        --KOKILLE
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, v_time+numtodsinterval(2,'HOUR'), null, null, null, 0);
        INSERT INTO CHARGE_ANLAGENTEIL_MAPPING(CHARGE_ID, INGOING, OUTGOING, PFANNE_ID, VERTEILER_ID, KOKILLE_ID)
        VALUES(v_charge_id, null, v_time+numtodsinterval(3,'HOUR'), null, null, 0);

        FOR i_productnum IN 1..9 LOOP
            SELECT produkt_seq.nextval INTO v_product_id FROM dual;
            
            INSERT INTO PRODUKT(ID, CHARGE_ID, NAME, TIMESTAMP) 
            VALUES(v_product_id, v_charge_id, 'C'||i_chargenum||'_P'||i_productnum, v_time+numtodsinterval(60,'SECOND'));
        END LOOP;
        
        v_time := v_time+numtodsinterval(1,'HOUR');
        
    END LOOP;
END mass_insert;
/
SET SERVEROUTPUT ON;
BEGIN
    clear_tables;
    mass_insert(40);
END;
/
SELECT cam.charge_id,c.name,
    CASE
        WHEN (MAX(cam.outgoing) < SYSDATE) THEN 'Fertig'
        WHEN (MIN(cam.ingoing) > SYSDATE) THEN 'in Planung'
        WHEN (CAST(MAX(cam.outgoing) as DATE)-SYSDATE)*24 < 1 THEN 'Kokille'
        WHEN (CAST(MAX(cam.outgoing) as DATE)-SYSDATE)*24 < 2 THEN 'Verteiler'
        WHEN (CAST(MAX(cam.outgoing) as DATE)-SYSDATE)*24 < 3 THEN 'Pfanne'
        ELSE 'invalid'
    END status
FROM charge_anlagenteil_mapping cam
INNER JOIN charge c
ON cam.charge_id=c.id
GROUP BY cam.charge_id, c.name
ORDER BY cam.charge_id DESC;