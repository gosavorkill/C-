CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT p.name AS pizzeria_name
    FROM menu
    JOIN pizzeria p ON p.id = menu.pizzeria_id
    JOIN person_visits perv ON p.id = perv.pizzeria_id
    JOIN person per ON per.id = perv.person_id
    WHERE per.name = pperson
    AND menu.price < pprice
    AND perv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;