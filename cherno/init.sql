CREATE TABLE statistics (
    id SERIAL PRIMARY KEY,
    games INTEGER,
    kick_gate INTEGER,
    came_out INTEGER,
    returned INTEGER,
    assist INTEGER,
    earned_penalty INTEGER,
    player_id INTEGER NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  logo_big UUID NULL,
  logo_medium UUID NULL,
  logo_small UUID NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE team_manager (
  id SERIAL PRIMARY KEY,
  team_id INTEGER,
  manager_id INTEGER UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE team_player (
  id SERIAL PRIMARY KEY,
  team_id INTEGER,
  player_id INTEGER UNIQUE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    patronymic VARCHAR(100) NULL,
    date_of_birth TIMESTAMP,
    pic_url UUID NULL,
    number INTEGER,
    career TEXT NULL,
    weight FLOAT,
    height FLOAT,
    country VARCHAR(255),
    role VARCHAR(255),
    photo_gallery UUID NULL,
    show BOOLEAN,
    main BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE manager(
    id SERIAL PRIMARY KEY,
    firstname varchar(100),
    lastname varchar(100),
    patronymic varchar(100) NULL,
    pic_url UUID NULL,
    date_of_birth TIMESTAMP,
    biography TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE stadium(
    id SERIAL PRIMARY KEY,
    name varchar (255),
    shortname varchar (125),
    address varchar (255),
    city varchar (255),
    pic_url UUID NULL,
    photo_gallery UUID,
    teams_id INTEGER[] NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE stadium_team(
    id SERIAL PRIMARY KEY,
    stadium_id INTEGER,
    team_id INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE news(
    id SERIAL PRIMARY KEY,
    title TEXT,
    subtitle TEXT NULL,
    json_content JSON,
    pic_url UUID NULL,
    vid_url UUID NULL,
    photo_gallery UUID NULL,
    video_gallery UUID NULL,
    valid_news BOOLEAN,
    slider_active BOOLEAN,
    news_block_active BOOLEAN,
    player_id INTEGER NULL,
    manager_id INTEGER NULL,
    match_id INTEGER NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER,
    team2_id INTEGER,
    start_time TIMESTAMP,
    stadium_id INTEGER NULL,
    referee_id INTEGER NULL,
    status TEXT,
    guess BOOLEAN,
    ligue_id INTEGER NULL,
    season_id INTEGER NULL,
    score varchar(5),
    create_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE referee(
    id SERIAL PRIMARY KEY,
    firstname varchar(150),
    lastname varchar(150),
    patronymic varchar(150) NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE season(
    id SERIAL PRIMARY KEY,
    name varchar (255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE ligue(
    id SERIAL PRIMARY KEY,
    name varchar (255),
    logo UUID NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE ligue_statistic(
    id SERIAL PRIMARY KEY,
    ligue_id INTEGER,
    team_id INTEGER,
    games INTEGER,
    wins INTEGER,
    draws INTEGER,
    losses INTEGER,
    scored_goals INTEGER,
    goals_against INTEGER,
    points INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE sponsor(
    id SERIAL PRIMARY KEY,
    name varchar(255),
    logo UUID NULL,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE block_partner(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    show BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE block_sponsor(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    show BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE main_page(
    id SERIAL PRIMARY KEY,
    melbet_banner UUID,
    advert_banner UUID,
    advert_url TEXT,
    fans_banner UUID,
    fans_url TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE main_page(
  id SERIAL PRIMARY KEY,
  melbet_banner_id INTEGER,
  advert_banner_id INTEGER,
  fans_banner_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE TABLE advert_banners(
  id SERIAL PRIMARY KEY,
  advert_banner_big UUID,
  advert_banner_medium UUID,
  advert_banner_small UUID,
  advert_banner_url TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE TABLE melbet_banners(
  id SERIAL PRIMARY KEY,
  melbet_banner_big UUID,
  melbet_banner_medium UUID,
  melbet_banner_small UUID,
  melbet_banner_url TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE TABLE fans_banners(
   id SERIAL PRIMARY KEY,
   fans_banner_big UUID,
   fans_banner_medium UUID,
   fans_banner_small UUID,
   fans_banner_url TEXT,
   created_at TIMESTAMP,
   updated_at TIMESTAMP,
   deleted_at TIMESTAMP
);

ALTER TABLE stadium_team
ADD CONSTRAINT fk_stadium_team_stadium
FOREIGN KEY (stadium_id)
REFERENCES stadium(id);

ALTER TABLE stadium_team
ADD CONSTRAINT fk_stadium_team_team
FOREIGN KEY (team_id)
REFERENCES team(id);

ALTER TABLE ligue_statistic
ADD CONSTRAINT fk_ligue_statistic_ligue
FOREIGN KEY (ligue_id)
REFERENCES ligue(id);

ALTER TABLE team_player
ADD CONSTRAINT fk_team_player_team
FOREIGN KEY (team_id)
REFERENCES team(id);

ALTER TABLE team_player
ADD CONSTRAINT fk_team_player_player
FOREIGN KEY (player_id)
REFERENCES player(id);

ALTER TABLE team_manager
ADD CONSTRAINT fk_team_manager_team
FOREIGN KEY (team_id)
REFERENCES team(id);

ALTER TABLE team_manager
ADD CONSTRAINT fk_team_manager_manager
FOREIGN KEY (manager_id)
REFERENCES manager(id);

ALTER TABLE news
ADD CONSTRAINT fk_news_match
FOREIGN KEY (match_id)
REFERENCES match(id);

ALTER TABLE news
ADD CONSTRAINT fk_news_player
FOREIGN KEY (player_id)
REFERENCES player(id);

ALTER TABLE news
ADD CONSTRAINT fk_news_manager
FOREIGN KEY (manager_id)
REFERENCES manager(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_team1
FOREIGN KEY (team1_id)
REFERENCES team(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_team2
FOREIGN KEY (team2_id)
REFERENCES team(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_referee
FOREIGN KEY (referee_id)
REFERENCES referee(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_stadium
FOREIGN KEY (stadium_id)
REFERENCES stadium(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_ligue
FOREIGN KEY (ligue_id)
REFERENCES ligue(id);

ALTER TABLE match
ADD CONSTRAINT fk_match_season
FOREIGN KEY (season_id)
REFERENCES season(id);

INSERT INTO sponsor (name, logo, description, created_at, updated_at, deleted_at) VALUES
    ('Sponsor1', NULL , 'Description for Sponsor1', NOW(), NOW(), NULL),
    ('Sponsor2', NULL, 'Description for Sponsor2', NOW(), NOW(), NULL),
    ('Sponsor3', NULL, 'Description for Sponsor3', NOW(), NOW(), NULL),
    ('Sponsor4', NULL, 'Description for Sponsor4', NOW(), NOW(), NULL),
    ('Sponsor5', NULL, 'Description for Sponsor5', NOW(), NOW(), NULL),
    ('Sponsor6', NULL, 'Description for Sponsor6', NOW(), NOW(), NULL),
    ('Sponsor7',NULL, 'Description for Sponsor7', NOW(), NOW(), NULL),
    ('Sponsor8', NULL, 'Description for Sponsor8', NOW(), NOW(), NULL),
    ('Sponsor9', NULL, 'Description for Sponsor9', NOW(), NOW(), NULL),
    ('Sponsor10', NULL, 'Description for Sponsor10', NOW(), NOW(), NULL);

INSERT INTO block_partner (title, description, show, created_at, updated_at, deleted_at) VALUES
    ('Partner1', 'Description for Partner1', false, NOW(), NOW(), NULL),
    ('Partner2', 'Description for Partner2', false, NOW(), NOW(), NULL),
    ('Partner3', 'Description for Partner3', false, NOW(), NOW(), NULL),
    ('Partner4', 'Description for Partner4', false, NOW(), NOW(), NULL),
    ('Partner5', 'Description for Partner5', true, NOW(), NOW(), NULL),
    ('Partner6', 'Description for Partner6', true, NOW(), NOW(), NULL),
    ('Partner7', 'Description for Partner7', true, NOW(), NOW(), NULL),
    ('Partner8', 'Description for Partner8', true, NOW(), NOW(), NULL),
    ('Partner9', 'Description for Partner9', true, NOW(), NOW(), NULL),
    ('Partner10', 'Description for Partner10', true,  NOW(), NOW(), NULL);

INSERT INTO block_sponsor (title, description, show, created_at, updated_at, deleted_at) VALUES
    ('BlockSponsor1', 'Description for BlockSponsor1', false, NOW(), NOW(), NULL),
    ('BlockSponsor2', 'Description for BlockSponsor2', false, NOW(), NOW(), NULL),
    ('BlockSponsor3', 'Description for BlockSponsor3', false, NOW(), NOW(), NULL),
    ('BlockSponsor4', 'Description for BlockSponsor4', false, NOW(), NOW(), NULL),
    ('BlockSponsor5', 'Description for BlockSponsor5', false, NOW(), NOW(), NULL),
    ('BlockSponsor6', 'Description for BlockSponsor6', true, NOW(), NOW(), NULL),
    ('BlockSponsor7', 'Description for BlockSponsor7', true, NOW(), NOW(), NULL),
    ('BlockSponsor8', 'Description for BlockSponsor8', true, NOW(), NOW(), NULL),
    ('BlockSponsor9', 'Description for BlockSponsor9', true, NOW(), NOW(), NULL),
    ('BlockSponsor10', 'Description for BlockSponsor10', true, NOW(), NOW(), NULL);

INSERT INTO ligue (name, logo, created_at, updated_at) VALUES
    ('Лига 1',  NULL, NOW(), NOW()),
    ('Лига 2', NULL, NOW(), NOW()),
    ('Лига 3', NULL, NOW(), NOW()),
    ('Лига 4', NULL, NOW(), NOW()),
    ('Лига 5', NULL, NOW(), NOW()),
    ('Лига 6', NULL, NOW(), NOW()),
    ('Лига 7', NULL, NOW(), NOW()),
    ('Лига 8', NULL, NOW(), NOW()),
    ('Лига 9',NULL, NOW(), NOW()),
    ('Лига 10', NULL, NOW(), NOW());

INSERT INTO ligue_statistic (ligue_id, team_id, games, wins, draws, losses, scored_goals, goals_against, points, created_at, updated_at) VALUES
    (1, 1, 20, 15, 3, 2, 40, 15, 48, NOW(), NOW()),
    (2, 2, 20, 12, 5, 3, 35, 20, 41, NOW(), NOW()),
    (3, 3, 20, 14, 2, 4, 38, 18, 44, NOW(), NOW()),
    (4, 4, 20, 10, 6, 4, 30, 25, 36, NOW(), NOW()),
    (5, 5, 20, 11, 4, 5, 32, 22, 37, NOW(), NOW()),
    (6, 6, 20, 13, 3, 4, 36, 17, 42, NOW(), NOW()),
    (7, 7, 20, 9, 7, 4, 28, 21, 34, NOW(), NOW()),
    (8, 8, 20, 8, 6, 6, 25, 25, 30, NOW(), NOW()),
    (9, 9, 20, 10, 4, 6, 31, 27, 34, NOW(), NOW()),
    (10, 10, 20, 12, 2, 6, 33, 20, 38, NOW(), NOW());


INSERT INTO season (name, start_date, end_date, created_at, updated_at) VALUES
    ('Сезон 1', '2023-01-01', '2023-06-30', NOW(), NOW()),
    ('Сезон 2', '2023-07-01', '2023-12-31', NOW(), NOW()),
    ('Сезон 3', '2024-01-01', '2024-06-30', NOW(), NOW()),
    ('Сезон 4', '2024-07-01', '2024-12-31', NOW(), NOW()),
    ('Сезон 5', '2025-01-01', '2025-06-30', NOW(), NOW()),
    ('Сезон 6', '2025-07-01', '2025-12-31', NOW(), NOW()),
    ('Сезон 7', '2026-01-01', '2026-06-30', NOW(), NOW()),
    ('Сезон 8', '2026-07-01', '2026-12-31', NOW(), NOW()),
    ('Сезон 9', '2027-01-01', '2027-06-30', NOW(), NOW()),
    ('Сезон 10', '2027-07-01', '2027-12-31', NOW(), NOW());

INSERT INTO referee (firstname, lastname, patronymic, created_at, updated_at) VALUES
    ('Иван', 'Иванов', 'Иванович', NOW(), NOW()),
    ('Петр', 'Петров', 'Петрович', NOW(), NOW()),
    ('Анна', 'Сидорова', 'Ивановна', NOW(), NOW()),
    ('Александр', 'Козлов', 'Сергеевич', NOW(), NOW()),
    ('Мария', 'Николаева', 'Александровна', NOW(), NOW()),
    ('Дмитрий', 'Смирнов', 'Дмитриевич', NOW(), NOW()),
    ('Екатерина', 'Иванова', 'Петровна', NOW(), NOW()),
    ('Андрей', 'Андреев', 'Андреевич', NOW(), NOW()),
    ('Ольга', 'Ольгова', 'Ольговна', NOW(), NOW()),
    ('Сергей', 'Сергеев', 'Сергеевич', NOW(), NOW());

INSERT INTO news (title, subtitle, content, pic_url, vid_url, photo_gallery, video_gallery, valid_news, slider_active, news_block_active, created_at, updated_at) VALUES
    ('Новость 1', NULL, 'Описание новости 1', NULL, NULL, NULL, NULL, true, true, true, NOW(), NOW()),
    ('Новость 2', NULL, 'Описание новости 2', NULL, NULL,NULL, NULL, true, true, true, NOW(), NOW()),
    ('Новость 3', 'Подзаголовок новости 3', NULL, NULL, NULL, NULL, NULL, true, true, false, NOW(), NOW()),
    ('Новость 4', NULL, 'Описание новости 4',NULL,NULL,NULL,NULL, true, false, true, NOW(), NOW()),
    ('Новость 5', NULL, 'Описание новости 5', NULL, NULL,NULL, NULL, true, true, false, NOW(), NOW()),
    ('Новость 6', 'Подзаголовок новости 6', NULL, NULL, NULL, NULL, NULL, true, true, true, NOW(), NOW()),
    ('Новость 7', NULL, 'Описание новости 7', NULL,NULL, NULL, NULL, true, true, true, NOW(), NOW()),
    ('Новость 8', NULL, 'Описание новости 8', NULL, NULL, NULL, NULL, true, false, false, NOW(), NOW()),
    ('Новость 9', 'Подзаголовок новости 9', 'Описание новости 9', NULL,NULL, NULL,NULL, true, true, true, NOW(), NOW()),
    ('Новость 10', NULL, 'Описание новости 10', NULL, NULL, NULL, NULL, true, true, false, NOW(), NOW());

INSERT INTO manager (firstname, lastname, patronymic, pic_url, date_of_birth, biography, created_at, updated_at, deleted_at) VALUES
     ('John', 'Doe', 'Sr.', NULL, '1990-01-01', 'Experienced manager in the field.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Jane', 'Smith', 'Jr.',NULL, '1985-05-15', 'Skilled leader with a passion for success.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Bob', 'Johnson', '',NULL, '1978-11-30', 'Team-oriented manager with proven results.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Alice', 'Williams', 'III', NULL, '1995-03-20', 'Innovative thinker with strategic vision.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Charlie', 'Brown', '', NULL, '1982-09-10', 'Motivational leader driving team performance.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Eva', 'Davis', 'Sr.', NULL, '1988-07-25', 'Passionate about organizational development.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Michael', 'Anderson', 'Jr.', NULL, '1992-04-12', 'Proactive manager with strong communication skills.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Sophia', 'Miller', '', NULL, '1975-12-05', 'Results-driven professional with extensive experience.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Ryan', 'Garcia', 'III', NULL, '1980-06-18', 'Strategic planner focused on achieving goals.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Emma', 'Turner', '', NULL, '1998-02-28', 'Adaptable leader fostering a positive work environment.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO stadium (name, shortname, address, city, pic_url, photo_gallery,  teams_id, created_at, updated_at, deleted_at) VALUES
    ('Stadium1', 'St1', 'Address1', 'City1', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium2', 'St2', 'Address2', 'City2', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium3', 'St3', 'Address3', 'City3',NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium4', 'St4', 'Address4', 'City4', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium5', 'St5', 'Address5', 'City5', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium6', 'St6', 'Address6', 'City6', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium7', 'St7', 'Address7', 'City7', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium8', 'St8', 'Address8', 'City8', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium9', 'St9', 'Address9', 'City9', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium10', 'St10', 'Address10', 'City10', NULL,NULL, ARRAY[1,2], CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO team (name, logo_big, logo_medium, logo_small, created_at, updated_at) VALUES
    ('Team A', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team B', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team C', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team D', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team E', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team F', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team G', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team H', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team I', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team J', NULL, NULL ,NULL , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO player (firstname, lastname, patronymic, date_of_birth, pic_url, number, career, weight, height, country, role, photo_gallery, show, main, created_at, updated_at) VALUES
    ('John', 'Doe', 'Smith', '1990-05-15', '550e8400-e29b-41d4-a716-446655440000', 23, 'Professional', 75.5, 180.5, 'USA', 'Forward', '550e8400-e29b-41d4-a716-446655440001', true, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Alice', 'Johnson', NULL, '1988-12-10', NULL, 7, 'Amateur', 68.2, 170.0, 'Canada', 'Midfielder', NULL, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Michael', 'Williams', NULL, '1995-07-22', NULL, 11, 'Professional', 80.0, 185.0, 'England', 'Goalkeeper', NULL, true, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Samantha', 'Miller', NULL, '1993-02-18', NULL, 5, 'Semi-Professional', 62.8, 167.5, 'Australia', 'Defender', NULL, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('David', 'Lee', NULL, '1987-09-30', NULL, 9, 'Professional', 78.3, 190.0, 'South Korea', 'Forward', NULL, true, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Emma', 'Clark', NULL, '1998-04-05', NULL, 14, 'Amateur', 65.0, 175.0, 'Germany', 'Midfielder', NULL, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Daniel', 'Harris', NULL, '1991-11-12', NULL, 17, 'Professional', 82.5, 188.0, 'Brazil', 'Defender', NULL, true, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Sophie', 'Turner', NULL, '1996-08-25', NULL, 21, 'Professional', 68.5, 172.5, 'France', 'Midfielder', NULL, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Ethan', 'Brown', NULL, '1994-03-08', NULL, 3, 'Semi-Professional', 75.0, 180.0, 'Spain', 'Goalkeeper', NULL, true, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Olivia', 'Martin', NULL, '1997-06-20', NULL, 8, 'Amateur', 64.2, 166.0, 'Italy', 'Forward', NULL, true, false, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO statistics (games, kick_gate, came_out, returned, assist, earned_penalty, player_id, created_at, updated_at) VALUES
    (0, 0, 0, 0, 0, 0, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (20, 10, 5, 2, 8, 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (18, 8, 3, 1, 5, 2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (22, 12, 4, 0, 10, 4, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (25, 15, 7, 3, 12, 5, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (19, 9, 6, 2, 7, 3, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (21, 11, 5, 1, 9, 4, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (24, 14, 6, 3, 11, 6, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (17, 7, 4, 1, 4, 2, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (23, 13, 5, 2, 10, 5, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (20, 10, 6, 2, 8, 3, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO match (team1_id, team2_id, start_time, stadium_id, referee_id, status, guess, ligue_id, season_id, score, create_at, updated_at) VALUES
     (1, 2, '2023-01-15 18:00:00', 1, 1, 'Scheduled', true, 1, 1, '0-0', NOW(), NOW()),
     (3, 4, '2023-01-16 15:30:00', 2, 2, 'In Progress', false, 2, 1, '1-1', NOW(), NOW()),
     (5, 6, '2023-01-17 20:45:00', 3, 3, 'Completed', true, 3, 1, '2-1', NOW(), NOW()),
     (7, 8, '2023-01-18 16:00:00', 4, 4, 'Completed', false, 4, 1, '3-0', NOW(), NOW()),
     (9, 10, '2023-01-19 19:30:00', 5, 5, 'Scheduled', true, 5, 1, '0-0', NOW(), NOW()),
     (1, 3, '2023-01-20 14:00:00', 6, 6, 'In Progress', false, 6, 1, '1-2', NOW(), NOW()),
     (2, 4, '2023-01-21 17:15:00', 7, 7, 'Completed', true, 7, 1, '2-2', NOW(), NOW()),
     (5, 7, '2023-01-22 20:30:00', 8, 8, 'Scheduled', false, 8, 1, '0-0', NOW(), NOW()),
     (6, 8, '2023-01-23 16:45:00', 9, 9, 'In Progress', true, 9, 1, '1-0', NOW(), NOW()),
     (9, 10, '2023-01-24 19:00:00', 10, 10, 'Completed', false, 10, 1, '3-1', NOW(), NOW());

INSERT INTO stadium_team (stadium_id, team_id, created_at, updated_at) VALUES
    (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (10, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO team_player (team_id, player_id, created_at, updated_at) VALUES
    (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (10, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO team_manager (team_id, manager_id, created_at, updated_at) VALUES
    (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (10, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO main_page (melbet_banner, advert_banner, advert_url, fans_banner, fans_url, created_at, updated_at, deleted_at) VALUES
    ('550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'http://example.com/advert1', '550e8400-e29b-41d4-a716-446655440002', 'http://example.com/fans1', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'http://example.com/advert2', '550e8400-e29b-41d4-a716-446655440005', 'http://example.com/fans2', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', 'http://example.com/advert3', '550e8400-e29b-41d4-a716-446655440008', 'http://example.com/fans3', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440010', 'http://example.com/advert4', '550e8400-e29b-41d4-a716-446655440011', 'http://example.com/fans4', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440013', 'http://example.com/advert5', '550e8400-e29b-41d4-a716-446655440014', 'http://example.com/fans5', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440016', 'http://example.com/advert6', '550e8400-e29b-41d4-a716-446655440017', 'http://example.com/fans6', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440018', '550e8400-e29b-41d4-a716-446655440019', 'http://example.com/advert7', '550e8400-e29b-41d4-a716-446655440020', 'http://example.com/fans7', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440021', '550e8400-e29b-41d4-a716-446655440022', 'http://example.com/advert8', '550e8400-e29b-41d4-a716-446655440023', 'http://example.com/fans8', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440024', '550e8400-e29b-41d4-a716-446655440025', 'http://example.com/advert9', '550e8400-e29b-41d4-a716-446655440026', 'http://example.com/fans9', NOW(), NOW(), NULL),
    ('550e8400-e29b-41d4-a716-446655440027', '550e8400-e29b-41d4-a716-446655440028', 'http://example.com/advert10', '550e8400-e29b-41d4-a716-446655440029', 'http://example.com/fans10', NOW(), NOW(), NULL);

CREATE OR REPLACE FUNCTION update_player_statistic_id()
RETURNS TRIGGER AS $$
BEGIN
UPDATE player
SET statistic_id = NEW.statistic_id
WHERE player_id = NEW.player_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_player_statistic_id_trigger
AFTER INSERT ON statistics
FOR EACH ROW
EXECUTE FUNCTION update_player_statistic_id();

CREATE OR REPLACE FUNCTION update_ligue_statistic_id()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE ligue
    SET ligue_statistics_id =
            CASE
                WHEN ligue.ligue_statistics_id <> '' THEN CONCAT(ligue.ligue_statistics_id, ',', NEW.ligues_tatistic_id::TEXT)
                ELSE NEW.ligues_tatistic_id::TEXT
                END
    WHERE ligue_id = NEW.ligue_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ligue_statistic_id_trigger
    AFTER INSERT ON ligue_statistic
    FOR EACH ROW
EXECUTE FUNCTION update_ligue_statistic_id();