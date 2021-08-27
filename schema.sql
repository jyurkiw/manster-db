CREATE TABLE default_statistics (
    ds_id int PRIMARY KEY,
    challenge_rating float,
    proficiency_bonus int,
    armor_class int,
    min_hitpoints int,
    max_hitpoints int,
    attack_bonus int,
    min_damage int,
    max_damage int,
    save_difficulty int
);

INSERT INTO
    default_statistics (
        ds_id,
        challenge_rating,
        proficiency_bonus,
        armor_class,
        min_hitpoints,
        max_hitpoints,
        attack_bonus,
        min_damage,
        max_damage,
        save_difficulty
    )
VALUES
    (1, 0, 2, 13, 1, 6, 3, 0, 1, 13),
    (2, 0.125, 2, 13, 7, 35, 3, 2, 3, 13),
    (3, 0.025, 2, 13, 36, 49, 3, 4, 5, 13),
    (4, 0.5, 2, 13, 50, 70, 3, 6, 8, 13),
    (5, 1, 2, 13, 71, 85, 3, 9, 14, 13),
    (6, 2, 2, 13, 86, 100, 3, 15, 20, 13),
    (7, 3, 2, 13, 101, 115, 4, 21, 26, 13),
    (8, 4, 2, 14, 116, 130, 5, 27, 32, 14),
    (9, 5, 3, 15, 131, 145, 6, 33, 38, 15),
    (10, 6, 3, 15, 146, 160, 6, 39, 44, 15),
    (11, 7, 3, 15, 161, 175, 6, 45, 50, 15),
    (12, 8, 3, 16, 176, 190, 7, 51, 56, 16),
    (13, 9, 4, 16, 191, 205, 7, 57, 62, 16),
    (14, 10, 4, 17, 206, 220, 7, 63, 68, 16),
    (15, 11, 4, 17, 221, 235, 8, 69, 74, 17),
    (16, 12, 4, 17, 236, 250, 8, 75, 80, 17),
    (17, 13, 5, 18, 251, 265, 8, 81, 86, 18),
    (18, 14, 5, 18, 266, 280, 8, 87, 92, 18),
    (19, 15, 5, 18, 281, 295, 8, 93, 98, 18),
    (20, 16, 5, 18, 296, 310, 9, 99, 104, 18),
    (21, 17, 6, 19, 311, 325, 10, 105, 110, 19),
    (22, 18, 6, 19, 326, 340, 10, 111, 116, 19),
    (23, 19, 6, 19, 341, 355, 10, 117, 122, 19),
    (24, 20, 6, 19, 356, 400, 10, 123, 140, 19),
    (25, 21, 7, 19, 401, 445, 11, 141, 158, 20),
    (26, 22, 7, 19, 446, 490, 11, 159, 176, 20),
    (27, 23, 7, 19, 491, 535, 11, 177, 194, 20),
    (28, 24, 7, 19, 536, 580, 12, 195, 212, 21),
    (29, 25, 8, 19, 581, 625, 12, 213, 230, 21),
    (30, 26, 8, 19, 626, 670, 12, 231, 248, 21),
    (31, 27, 8, 19, 671, 715, 13, 249, 266, 22),
    (32, 28, 8, 19, 716, 760, 13, 267, 284, 22),
    (33, 29, 9, 19, 761, 805, 13, 285, 302, 22),
    (34, 30, 9, 19, 806, 850, 14, 303, 320, 23);

CREATE VIEW offensive_stats AS
SELECT
    ds_id,
    challenge_rating AS ocr,
    proficiency_bonus,
    attack_bonus,
    min_damage,
    max_damage,
    save_difficulty
FROM
    default_statistics;

CREATE VIEW defensive_stats AS
SELECT
    ds_id,
    challenge_rating AS dcr,
    armor_class,
    min_hitpoints,
    max_hitpoints
FROM
    default_statistics;

CREATE TABLE die_avg (
    num_sides int PRIMARY KEY,
    avg_roll float
);

INSERT INTO
    die_avg (num_sides, avg_roll)
VALUES
    (4, 2.5),
    (6, 3.5),
    (8, 4.5),
    (10, 5.5),
    (12, 6.5),
    (20, 10.5);

CREATE TABLE size_damage (
    size_id int PRIMARY KEY,
    size varchar(16),
    num_dice int
);

INSERT INTO
    size_damage (size_id, size, num_dice)
VALUES
    (1, 'Tiny', 1),
    (2, 'Small', 1),
    (3, 'Medium', 1),
    (4, 'Large', 2),
    (5, 'Huge', 3),
    (6, 'Gargantuan', 4);

CREATE TABLE damage_types (
    damage_type_id int PRIMARY KEY,
    damage_type varchar(16)
);

INSERT INTO
    damage_types (damage_type_id, damage_type)
VALUES
    (1, 'Bludgeoning'),
    (2, 'Slashing'),
    (3, 'Piercing'),
    (4, 'Acid'),
    (5, 'Cold'),
    (6, 'Fire'),
    (7, 'Force'),
    (8, 'Lightning'),
    (9, 'Necrotic'),
    (10, 'Poison'),
    (11, 'Psychic'),
    (12, 'Radiant'),
    (13, 'Thunder');

CREATE TABLE ability_types (
    ability_type_id int PRIMARY KEY,
    type_name varchar(24)
);

INSERT INTO
    ability_types (ability_type_id, type_name)
VALUES
    (1, 'Trait'),
    (2, 'Action'),
    (3, 'Bonus Action'),
    (4, 'Reaction'),
    (5, 'Legendary Action'),
    (6, 'Lair Action');

CREATE TABLE spell_slots (
    caster_level_id int PRIMARY KEY,
    level_1 int,
    level_2 int,
    level_3 int,
    level_4 int,
    level_5 int,
    level_6 int,
    level_7 int,
    level_8 int,
    level_9 int
);

INSERT INTO
    spell_slots (
        caster_level_id,
        level_1,
        level_2,
        level_3,
        level_4,
        level_5,
        level_6,
        level_7,
        level_8,
        level_9
    )
VALUES
    (1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    (2, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    (3, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    (4, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    (5, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    (6, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    (7, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    (8, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    (9, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    (10, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    (11, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    (12, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    (13, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    (14, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    (15, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    (16, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    (17, 4, 3, 3, 3, 2, 1, 1, 1, 1),
    (18, 4, 3, 3, 3, 3, 1, 1, 1, 1),
    (19, 4, 3, 3, 3, 3, 2, 1, 1, 1),
    (20, 4, 3, 3, 3, 3, 2, 2, 1, 1);

CREATE TABLE spell_levels (
    spell_level_id int PRIMARY KEY,
    spell_level_name varchar(7)
);

INSERT INTO
    spell_levels
VALUES
    (1, '1st'),
    (2, '2nd'),
    (3, '3rd'),
    (4, '4th'),
    (5, '5th'),
    (6, '6th'),
    (7, '7th'),
    (8, '8th'),
    (9, '9th'),
    (10, 'Cantrip');

CREATE TABLE monsters (
    monster_id int PRIMARY KEY generated always AS identity,
    monster_name varchar(255),
    strength int,
    dexterity int,
    constitution int,
    intelligence int,
    wisdom int,
    charisma int,
    size_id int,
    num_hd int,
    effective_hp_mod int,
    avg_hp float,
    attackbonus_bonus int,
    armorclass_bonus int,
    effective_caster_level int DEFAULT 0,
    savedc_bonus int,
    base_offensive_cr_id int,
    total_offensive_cr float,
    base_defensive_cr_id int,
    total_defensive_cr float,
    CONSTRAINT monster_size_fk FOREIGN KEY(size_id) REFERENCES size_damage(size_id) ON DELETE CASCADE,
    CONSTRAINT monster_default_statistics_ocr_fk FOREIGN KEY(base_offensive_cr_id) REFERENCES default_statistics(ds_id) ON DELETE CASCADE,
    CONSTRAINT monster_default_statistics_dcr_fk FOREIGN KEY(base_defensive_cr_id) REFERENCES default_statistics(ds_id) ON DELETE CASCADE
);

CREATE TABLE attacks (
    attack_id int PRIMARY KEY generated always AS identity,
    monster_id int,
    attack_name varchar(128),
    attack_bonus int DEFAULT 0,
    save_dc int DEFAULT 0,
    avg_damage float,
    num_dice int,
    num_sides int,
    damage_bonus int,
    damage_type_id int,
    num_targets int DEFAULT 1,
    CONSTRAINT attack_monster_fk FOREIGN KEY(monster_id) REFERENCES monsters(monster_id) ON DELETE CASCADE,
    CONSTRAINT attack_damage_type_fk FOREIGN KEY(damage_type_id) REFERENCES damage_types(damage_type_id) ON DELETE CASCADE
);

CREATE TABLE monster_spells (
    monster_spell_id int PRIMARY KEY generated always AS identity,
    monster_id int,
    spell_level_id int,
    spell_names varchar(255),
    CONSTRAINT monster_spell_monster_fk FOREIGN KEY(monster_id) REFERENCES monsters(monster_id) ON DELETE CASCADE,
    CONSTRAINT monster_spell_level_id FOREIGN KEY(spell_level_id) REFERENCES spell_levels(spell_level_id) ON DELETE CASCADE
);

CREATE TABLE multiattacks (
    monster_id int,
    attack_id int,
    attack_order int,
    PRIMARY KEY(monster_id, attack_id),
    CONSTRAINT multi_monster_fk FOREIGN KEY(monster_id) REFERENCES monsters(monster_id) ON DELETE CASCADE,
    CONSTRAINT multi_attack_fk FOREIGN KEY(attack_id) REFERENCES attacks(attack_id) ON DELETE CASCADE
);

CREATE TABLE attack_riders (
    monster_id int,
    attack_id int,
    rider_id int,
    rider_order int,
    PRIMARY KEY(monster_id, attack_id, rider_id),
    CONSTRAINT rider_monster_fk FOREIGN KEY(monster_id) REFERENCES monsters(monster_id) ON DELETE CASCADE,
    CONSTRAINT rider_lead_attack_fk FOREIGN KEY(attack_id) REFERENCES attacks(attack_id) ON DELETE CASCADE,
    CONSTRAINT rider_attack_fk FOREIGN KEY(rider_id) REFERENCES attacks(attack_id) ON DELETE CASCADE
);

CREATE TABLE monster_attributes (
    attribute_id int PRIMARY KEY generated always AS identity,
    monster_id int,
    type_id int,
    attribute_text text
);

-- Insert a test monster
INSERT INTO
    monsters (
        monster_name,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        size_id,
        num_hd,
        effective_hp_mod,
        avg_hp,
        attackbonus_bonus,
        savedc_bonus,
        base_offensive_cr_id,
        total_offensive_cr,
        base_defensive_cr_id,
        total_defensive_cr
    )
VALUES
    (
        'Kobold Sorcerer Assassin',
        7,
        13,
        11,
        15,
        13,
        19,
        2,
        23,
        0,
        23 * 3.5,
        1,
        3,
        10,
        12,
        8,
        8
    );

INSERT INTO
    attacks (
        monster_id,
        attack_name,
        attack_bonus,
        save_dc,
        avg_damage,
        num_dice,
        num_sides,
        damage_bonus,
        damage_type_id
    )
VALUES
    (
        (
            SELECT
                monster_id
            FROM
                monsters
            WHERE
                monster_name = 'Kobold Sorcerer Assassin'
        ),
        'Poisoned Dagger',
        6,
        19,
        5,
        1,
        6,
        2,
        3
    );