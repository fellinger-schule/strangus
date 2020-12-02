SELECT param.name, aim as Ziel, epm.min as Minimum, epm.max as Maximum, param.Einheit
FROM ezv
INNER JOIN ezv_param_mapping epm
ON ezv.id=epm.ezv_id
INNER JOIN PARAMETER param
ON epm.parameter_id=param.id
WHERE ezv.id IN (0,1, 2,3);

SELECT param.name, tparam.text as Ziel, epm.min as Minimum, epm.max as Maximum, param.Einheit
FROM ezv
INNER JOIN ezv_param_mapping epm
ON ezv.id=epm.ezv_id
INNER JOIN PARAMETER param
ON epm.parameter_id=param.id
INNER JOIN TEXT_PARAM tparam
ON param.id = tparam.param_id
WHERE epm.aim=tparam.equivalentnumber;

SELECT c.ID as ChargeID, c.Name as Chargename, p.id as ProduktID, p.Name as ProduktName
FROM CHARGE c
INNER JOIN EZV 
ON c.ezv_id=ezv.id
INNER JOIN Produkt p
ON ezv.produkt_id=p.id;