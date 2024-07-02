SELECT * FROM entity

SELECT id,name,status FROM entity

SELECT DISTINCT * FROM entity

SELECT name || '(' || status || ')' AS name_and_status FROM entity ; 

SELECT name, lower(name), upper(name) FROM entity 

"Alias"

SELECT
    e.id AS id_entity,
    e.name AS nom_societe,
    a.id_address,
    a.address,
    a.countries
FROM
    entity e, address a ;

"Where"

SELECT *
FROM address
WHERE countries = 'JEY' OR countries = 'PAN'

SELECT *
FROM address
WHERE countries IN ('JEY', 'PAN');

"Join"

SELECT *
FROM entity
JOIN address ON entity.id_address = address.id_address ;

SELECT *
FROM entity, address
WHERE entity.id_address = address.id_address
	AND entity.name = 'Big Data Crunchers Ltd.';

"Join ManyToMany"

SELECT
	i.id as intermediary_id,
	i.name as intermediary_name,
	e.id as entity_id,
	e.name as entity_name,
	e.status as entity_status
FROM
	entity e,
	assoc_inter_entity a,
	intermediary i
WHERE
	e.id = a.entity
	AND a.inter = i.id
	AND e.name = 'Big Data Crunchers Ltd.' ;

"Left"

SELECT *
FROM entity
LEFT OUTER JOIN address ON entity.id_address = address.id_address;

"Group by"

SELECT
    jurisdiction,
    status,
    avg(lifetime),
    count(*)
FROM
    entity
GROUP BY
    jurisdiction, status

"Having"

SELECT
	i.id AS intermediary_id,
	i.name AS intermediary_name,
	e.jurisdiction,
	e.jurisdiction_description,
	count(*) as nb_societes
FROM
	intermediary i,
	assoc_inter_entity a,
	entity e
WHERE
	a.entity = e.id AND
	a.inter = i.id AND
	(i.id = 5000 OR i.id = 5001)
GROUP BY
	i.id, i.name, e.jurisdiction, e.jurisdiction_description
HAVING
	count(*) > 50 ;

"Order by"

SELECT * FROM entity ORDER BY incorporation_date DESC ;

SELECT * FROM entity ORDER BY nb ASC, incorporation_date DESC ;

"Union"

SELECT "Adresse" AS type, address AS recherche, NULL AS url, id_address AS identifiant FROM address
UNION
SELECT "Société (entité)" AS type, name AS recherche, url AS url, id AS identifiant FROM entity

"Like"

SELECT * FROM entity WHERE lower(name) LIKE 'a%' ;
