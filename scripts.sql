CREATE OR REPLACE VIEW public.v_votos
AS SELECT v.agrupacion AS votos_agrupacion,
    v.seccion AS votos_departamento,
    v.idcircuito AS votos_idcircuito,
    v.votos AS votos_cantidad,
    cem.id_0 AS cem_idcircuito,
    cem.geom AS cem_geom,
    cem.circuito AS cem_circuito,
    cem.departamen AS cem_departamen,
    dm.departamento AS departamento_nombre,
    dm.geom AS departamento_geom
   FROM votos v
     LEFT JOIN circuitos_electorales_mendoza cem ON cem.id_0 = v.idcircuito
     LEFT JOIN departamentos_mendoza dm ON dm.departamento::text = cem.departamen::text
  WHERE v.agrupacion::text <> ''::text AND v.cargo::text = 'DIPUTADOS NACIONALES'::text AND v.tipovoto::text = 'positivo'::text AND cem.id_0 <> 136;