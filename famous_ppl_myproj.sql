/* Create table about the people and what they do here */
CREATE TABLE actors (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT);

INSERT INTO actors VALUES
    (1, "Blake", "Lively"),
    (2, "Ryan", "Reynolds"),
    (3, "Freddie", "Prinze JR"),
    (4, "Sarah", "M. Gellar"),
    (5, "Emily", "Blunt"),
    (6, "John", "Krasinski");
    
CREATE TABLE spouses (
    id INTEGER PRIMARY KEY,
    spouse1_id INTEGER,
    spouse2_id INTEGER);

INSERT INTO spouses (spouse1_id, spouse2_id) VALUES
    (1, 2),
    (3, 4),
    (5, 6);
    
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    actor_id INTEGER,
    title TEXT);

INSERT INTO movies (actor_id, title) VALUES
    (1, "Green Lantern"),
    (1, "Adaline"),
    (1, "Sisterhood"),
    (2, "Green Lantern"),
    (2, "Deadpool"),
    (2, "The Proposal"),
    (2, "Free Guy"),
    (3, "Scooby-Doo"),
    (3, "All That"),
    (3, "Last Summer"),
    (4, "Buffy"),
    (4, "Last Summer"),
    (4, "Scooby-Doo"),
    (5, "Devil Prada"),
    (5, "Quiet Place"),
    (6, "Quiet Place");

/*List all movies each actor's in */
SELECT actors.first_name, actors.last_name, movies.title
    FROM actors
    JOIN movies
    ON actors.id = movies.actor_id;
/* ^that was an inner join.
In our current case, we don't need an outer join... but normally you'd probably want to do it. Here's how it'd look:

SELECT actors.first_name, actors.last_name, movies.title
    FROM actors
    LEFT OUTER JOIN movies
    ON actors.id = movies.actor_id;
*/

/* List all actors & their respective partner.
Uses multiple joins */
SELECT a.first_name, a.last_name, b.first_name as spouse_first_name, b.last_name as spouse_last_name FROM spouses
    JOIN actors a
    ON a.id = spouses.spouse1_id
    JOIN actors b
    ON b.id = spouses.spouse2_id;

/* List actors & spouse if they appear in same movie & list said movie.
Uses */
SELECT movies.title, movies.actor_id FROM movies
    GROUP BY title
    HAVING COUNT(title) > 1;
