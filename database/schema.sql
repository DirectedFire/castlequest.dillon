
CREATE TABLE public.users (
    email TEXT PRIMARY KEY NOT NULL,
    password TEXT,
    lastName TEXT,
    firstName TEXT,
    playerID INTEGER
);

CREATE TABLE public.players (
    playerID INTEGER PRIMARY KEY NOT NULL,
    playerName TEXT,
    character TEXT,
    charName TEXT,
    xp INTEGER,
    hp INTEGER,
    gold INTEGER,
    email TEXT,

    CONSTRAINT players_constraint
        FOREIGN KEY(email)
        REFERENCES public.users(email)
);

CREATE TABLE public.items (
    itemID INTEGER PRIMARY KEY NOT NULL,
    quantity INTEGER,
    itemPrice INTEGER,
    itemName TEXT,
    playerID INTEGER,
CONSTRAINT items_constraint
    FOREIGN KEY(playerID)
    REFERENCES public.players(playerID)
);

CREATE TABLE public.guilds (
    guildID INTEGER PRIMARY KEY,
    guildName TEXT,
    playerID INTEGER,
    playerName TEXT,
CONSTRAINT guilds_constraint
    FOREIGN KEY(playerID)
    REFERENCES public.players(playerID)
);
DROP ROLE IF EXISTS castlequest;

CREATE ROLE castlequest WITH
    LOGIN
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION
    PASSWORD 'HudenBurger23';