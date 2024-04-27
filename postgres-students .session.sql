-- Зв'язок один до одного 1:1

CREATE TABLE coaches (
    id serial PRIMARY KEY,
    name varchar (256) CHECK (name !='') NOT NULL
)

CREATE TABLE teams (
    id serial PRIMARY KEY,
    name varchar (256) CHECK (name !='') NOT NULL,
    coach_id int  REFERENCES coaches (id)
)

ALTER TABLE coaches
ADD COLUMN team_id int REFERENCES teams (id)