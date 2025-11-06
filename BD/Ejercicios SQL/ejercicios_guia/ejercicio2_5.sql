-- Considerando el siguiente esquema de una base de datos que guarda informaci´on sobre
-- series:
-- ACTOR(idActor, nombreActor, edad)
-- SERIE(idSerie, nombreSerie, idGenero, añoInicio, añoFin)
-- GENERO(idGenero, nombreGenero)
-- CANAL(idCanal, nombreCanal)
-- PARTICIPA EN(idActor,idSerie)
-- TRANSMITE(idCanal, idSerie)
-- Se pide en SQL:
-- (a) Listar los nombres de los actores mayores de 30 a˜nos que participan en la serie
-- “Friends”.

SELECT 
    a.nombreActor
FROM
    ACTOR a
INNER JOIN
    PARTICIPA_EN p on a.idActor = p.idActor
INNER JOIN 
    SERIE s on s.idSerie = p.idSerie
WHERE 
    a.edad > 30 AND 
    s.nombreSerie = 'Friends'

-- (b) Listar los nombres de los canales que transmiten todas las series de comedia.

SELECT 
    c.nombreCanal
FROM CANAL c

WHERE NOT EXISTS( -- tiene que estar vacia la lista de series de comedia que no transmite: todas las de comedia - las suyas de comedia
    --todas las de comedia
    SELECT s.idSerie 
    FROM SERIE s INNER JOIN GENERO g on g.idGenero = s.idGenero 
    WHERE g.nombreGenero = 'Comedia'
    
    EXCEPT
    
    --todas las de comedia del canal c
    SELECT s.idSerie 
    FROM SERIE s INNER JOIN TRANSMITE t on s.idSerie = t.idSerie INNER JOIN CANAL c2 on c2.idCanal = t.idCanal INNER JOIN GENERO g on g.idGenero = s.idGenero
    WHERE g.nombreGenero = 'Comedia' AND c2.idCanal = c.idCanal
);

-- (c) Listar los nombres de los actores mayores de 30 a˜nos que participan en la serie
-- “Friends” y que adem´as participaron alguna vez en series que comenzaron luego del
-- a˜no 2000

SELECT 
    a.nombreActor
FROM
    ACTOR a
INNER JOIN
    PARTICIPA_EN p on a.idActor = p.idActor
INNER JOIN 
    SERIE s on s.idSerie = p.idSerie
WHERE 
    a.edad > 30 AND 
    s.nombreSerie = 'Friends' AND
    a.idActor IN (
        SELECT 
            a2.idActor
        FROM 
            ACTOR a2
        INNER JOIN
            PARTICIPA_EN p2 on a2.idActor = p2.idActor
        INNER JOIN 
            SERIE s2 on s2.idSerie = p2.idSerie
        WHERE s2.añoInicio > 2000
        )

-- (d) Listar los nombres de los actores mayores de 30 a˜nos que participan en la serie
-- “Friends” y que adem´as nunca participaron en series que comenzaron luego del a˜no
-- 2000.

SELECT 
    a.nombreActor
FROM
    ACTOR a
INNER JOIN
    PARTICIPA_EN p on a.idActor = p.idActor
INNER JOIN 
    SERIE s on s.idSerie = p.idSerie
WHERE 
    a.edad > 30 AND 
    s.nombreSerie = 'Friends' AND
    a.idActor NOT IN (
        SELECT 
            a2.idActor
        FROM 
            ACTOR a2
        INNER JOIN
            PARTICIPA_EN p2 on a2.idActor = p2.idActor
        INNER JOIN 
            SERIE s2 on s2.idSerie = p2.idSerie
        WHERE s2.añoInicio > 2000
        )

-- (e) Listar los ids de las series que comenzaron m´as recientemente.

SELECT 
    s.idSerie
FROM
    SERIE s 
WHERE s.añoInicio = (SELECT MAX(s2.añoInicio) FROM SERIE s2)

-- (f) Listar los ids de los actores que participaron en al menos 2 series.

SELECT
    a.idACTOR
FROM
    ACTOR a
INNER JOIN
    participa_en p on p.idActor = a.idActor
GROUP BY a.idActor
HAVING COUNT(*) > 1

-- de hecho basta con hacer

SELECT
  idActor
FROM
  PARTICIPA_EN
GROUP BY
  idActor
HAVING
  COUNT(*) > 1;

-- (g) Suponiendo que puede haber nombres de serie repetidos, listar los nombres que hayan
-- sido usados en dos o m´as series

SELECT
    s.nombreSerie
FROM 
    SERIE s
GROUP BY 
    s.nombreSerie
HAVING 
    COUNT(s.nombreSerie) > 1

-- (h) Considerando lo mismo del ejercicio anterior, listar todos los canales que trasmiten
-- alguna serie que tiene el nombre repetido.

SELECT DISTINCT
    c.nombreCanal
FROM 
    CANAL c
INNER JOIN 
    TRANSMITE t on t.idCanal = c.idCanal
INNER JOIN
    SERIE s2 on s2.idSerie = t.idSerie
WHERE s2.nombreSerie IN(
    SELECT
        s.nombreSerie
    FROM 
        SERIE s
    GROUP BY 
        s.nombreSerie
    HAVING 
        COUNT(s.nombreSerie) > 1
)


-- (i) Obtener la serie con el promedio de edad (de los actores) mas alto.

--esto le asigna cada serie su promedio
SELECT TOP 1
    s.nombreSerie, AVG(a.edad) as promedio
FROM 
    SERIE s 
INNER JOIN
    PARTICIPA_EN p on p.idSerie = s.idSerie
INNER JOIN
    ACTOR a on a.idActor = p.idActor
GROUP BY 
    s.idSerie , s.nombreSerie
ORDER BY promedio DESC

-- (j) Obtener la genero donde participa el actor m´as joven.

SELECT 
    g.nombreGenero
FROM 
    GENERO g
INNER JOIN
    SERIE s on s.idGenero = g.nombreGenero
INNER  JOIN 
    PARTICIPA p on p.idSerie = s.idSerie
INNER JOIN 
    ACTOR a on a.idActor = p.idActor
WHERE 
    a.edad = (
        SELECT MIN(edad) FROM ACTOR
    )