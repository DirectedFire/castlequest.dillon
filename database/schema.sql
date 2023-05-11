
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
    gold INTEGER,
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

    CREATE INDEX peopleusers ON public.users (firstName, lastName, playerID);

    CREATE INDEX characters ON public.players (playerID, playerName, charName, xp, gold);

    CREATE INDEX magicitems ON public.items (itemID, itemName, quantity, playerID);

    CREATE INDEX clans ON public.guilds (guildName, playerID, playerName);

    CREATE VIEW stats AS 
    SELECT playerName, charName, character, xp, gold, hp
    FROM public.players
    WHERE xp < 10000000 
    Order by xp DESC
    LIMIT 10;