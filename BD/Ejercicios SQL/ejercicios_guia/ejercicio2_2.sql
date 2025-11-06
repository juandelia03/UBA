-- Considerando el siguiente esquema de una base de datos:
-- FRECUENTA(Persona, Bar).
-- SIRVE (Bar, Cerveza).
-- GUSTA(Persona, Cerveza).


-- (a) Bares que sirven alguna cerveza que le guste a “Juan K.”

SELECT DISTINCT
    s.Bar
FROM 
    SIRVE s
INNER JOIN
    GUSTA g on g.Cerveza = s.Cerveza
WHERE g.Persona = 'Juan K.'


-- (b) Personas que frecuentan al menos un bar que sirve alguna cerveza que les guste.

SELECT DISTINCT 
    f.Persona
FROM 
    FRECUENTA f
INNER JOIN
    GUSTA g on g.Persona = f.Persona
INNER JOIN 
    SIRVE s on s.Bar = f.bar AND s.Cerveza = g.Cerveza

-- (c) Personas que no frecuenten ning´un bar que sirva una cerveza que les guste.

--usando NOT IN
SELECT DISTINCT
    p.Persona
FROM(
    SELECT 
        Persona
    FROM
        GUSTA
    UNION 
    SELECT 
        Persona
    FROM 
        FRECUENTA
) as p
WHERE p.persona NOT IN(
    SELECT 
        f.Persona
    FROM 
        FRECUENTA f
    INNER JOIN 
        SIRVE s on s.Bar = f.Bar
    INNER JOIN 
        GUSTA g on g.Persona = f.Persona AND g.Cerveza = s.Cerveza
)


-- Mejor todavía usando EXCEPT (RESTA) me traigo a todos y me saco a los que frecuentan algun bar que les gusta
(
    SELECT Persona FROM GUSTA
    UNION
    SELECT Persona FROM FRECUENTA
)
EXCEPT
SELECT 
    f.Persona
FROM 
    FRECUENTA f
INNER JOIN
    GUSTA g on g.Persona = f.Persona
INNER JOIN 
    SIRVE s on s.Bar = f.bar AND s.Cerveza = g.Cerveza;


-- (d) Personas que frecuentan todos los bares. (Asumir que todos los bares sirven al menos
-- una cerveza).

-- Agarro a todas las personas y me quedo con las que cumplen el not exist
-- la consulta del not exist trae todos los bares que no frecuenta (todos los bares - los bares que frecuenta el que estamos mirando)
-- si esa consulta da vacio entonces va a todos los bares
SELECT t.persona
FROM
(
    SELECT Persona FROM GUSTA
    UNION
    SELECT Persona FROM FRECUENTA
) as t
WHERE NOT EXISTS (
    (SELECT s.Bar FROM SIRVE s)
    
    EXCEPT 
    
    (SELECT f.Bar FROM Frecuenta f WHERE  t.Persona = f.Persona)
)


-- (e) (S´olo para SQL) Definir una vista que devuelva una relaci´on de la forma (p, c, b) de
-- tal manera que a la persona p le gusta la cerveza c, el bar b sirve la cerveza c y la
-- persona p frecuenta el bar b.

SELECT f.Persona,s.Cerveza,f.Bar
FROM 
    FRECUENTA f
INNER JOIN 
    SIRVE s ON f.Bar = s.Bar
INNER JOIN 
    GUSTA g on f.persona  = g.Persona AND g.Cerveza = s.Cerveza
