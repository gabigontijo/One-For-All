DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.Plano(
      `plano_id` INT NOT NULL AUTO_INCREMENT,
      `plano_type` VARCHAR(45) NOT NULL,
      `plano_price` FLOAT NOT NULL,
    PRIMARY KEY (`plano_id`)) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.Artista(
      `artista_id` INT NOT NULL AUTO_INCREMENT,
      `artista_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`artista_id`)) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.Album(
      `album_id` INT NOT NULL AUTO_INCREMENT,
      `album_name` VARCHAR(45) NOT NULL,
      `album_lancamento` YEAR NOT NULL,
      `artista_id` INT NOT NULL,
    PRIMARY KEY (`album_id`),
    INDEX `fk_artista_id_idx` (`artista_id` ASC),
      CONSTRAINT `fk_artista_id`
      FOREIGN KEY (`artista_id`)
      REFERENCES `SpotifyClone`.`Artista` (`artista_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.Cancoes(
      `cancoes_id` INT NOT NULL AUTO_INCREMENT,
      `cancoes_name` VARCHAR(45) NOT NULL,
      `artista_id` INT NOT NULL,
      `cancoes_duracao` INT NOT NULL,
      `album_id` INT NOT NULL,
    PRIMARY KEY (`cancoes_id`),
    INDEX `fk_artista_id_idx` (`artista_id` ASC),
    INDEX `fk_album_id_idx` (`album_id` ASC),
    CONSTRAINT `fk_cancao_artista_id`
      FOREIGN KEY (`artista_id`)
      REFERENCES `SpotifyClone`.`Artista` (`artista_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT `fk_cancao_album_id`
      FOREIGN KEY (`album_id`)
      REFERENCES `SpotifyClone`.`Album` (`album_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)  ENGINE = InnoDB;

    CREATE TABLE SpotifyClone.User(
        `user_id` INT NOT NULL AUTO_INCREMENT,
        `user_name` VARCHAR(255) NOT NULL,
        `user_age` INT NOT NULL,
        `data_assinatura` DATE NOT NULL,
        `plano_id` INT NOT NULL,
    PRIMARY KEY (`user_id`),
    INDEX `fk_plano_id_idx` (`plano_id` ASC),
    CONSTRAINT `fk_user_plano_id`
      FOREIGN KEY (`plano_id`)
      REFERENCES `SpotifyClone`.`Plano` (`plano_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION) ENGINE = InnoDB;

   CREATE TABLE SpotifyClone.Historico_reproducao(
        `cancoes_id` INT,
        `user_id` INT NOT NULL,
        `data_reproducao` DATETIME,
    INDEX `fk_user_id_idx` (`user_id` ASC) ,
    INDEX `fk_cancoes_id_idx` (`cancoes_id` ASC) ,
    CONSTRAINT `user_cancoes_unique` PRIMARY KEY (`user_id`, `cancoes_id`) ,
    CONSTRAINT `fk_historico_user_id`
      FOREIGN KEY (`user_id`)
      REFERENCES `SpotifyClone`.`User` (`user_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT `fk_historico_cancoes_id`
      FOREIGN KEY (`cancoes_id`)
      REFERENCES `SpotifyClone`.`Cancoes` (`cancoes_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION) ENGINE = InnoDB;

    CREATE TABLE SpotifyClone.Artista_seguidos(
        `artista_id` INT,
        `user_id` INT NOT NULL,
    INDEX `fk_artista_id_idx` (`artista_id` ASC) ,
    INDEX `fk_user_id_idx` (`user_id` ASC) ,
    CONSTRAINT `user_artista_unique` PRIMARY KEY (`user_id`, `artista_id`) ,
    CONSTRAINT `fk_seguidos_artista_id`
      FOREIGN KEY (`artista_id`)
      REFERENCES `SpotifyClone`.`Artista` (`artista_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT `fk_seguidos_user_id`
      FOREIGN KEY (`user_id`)
      REFERENCES `SpotifyClone`.`User` (`user_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.Plano (plano_type, plano_price)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.Artista (artista_name)
  VALUES
    ('Beyonce'),
    ('Queen'),
    ('Elis Regina'),
    ('Bacu Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simome');

  INSERT INTO SpotifyClone.Album (album_name, album_lancamento, artista_id)
  VALUES
    ('Renaissance', '2022', 1),
    ('Jazz', '1978', 2),
    ('Hot Space','1982', 2),
    ('Falso Brilhante', '1998', 3),
    ('Vento de Maio', '2001', 3),
    ('QVVJFA?', '2003', 4),
    ('Somewhere Far', '2007', 5),
    ('I put A Spell On You', '2012', 6);

  INSERT INTO SpotifyClone.Cancoes (cancoes_name, artista_id, cancoes_duracao, album_id)
  VALUES
    ('BREAK MY SOUL', 1 , 279, 1),
    ('VIRGO’S GROOVE', 1 , 369, 1),
    ('ALIEN SUPERSTAR', 1 , 116, 1),
    ('Don’t Stop Me Now', 2 , 203, 2),
    ('Under Pressure', 2 , 152, 3),
    ('Como Nossos Pais', 3 , 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 3 , 207, 5),
    ('Samba em Paris', 4 , 267, 6),
    ('The Bard’s Song', 5 , 244, 7),
    ('Feeling Good', 6 , 100, 8);


      INSERT INTO SpotifyClone.User (user_name, user_age, data_assinatura, plano_id)
  VALUES
    ('Barbara Liskov', 82 , '2019-10-20', 1),
    ('Robert Cecil Martin', 58 , '2017-01-06', 1),
    ('Ada Lovelace', 37 , '2017-01-06', 2),
    ('Martin Fowler', 46 , '2017-01-06', 2),
    ('Sandi Metz', 58 , '2017-01-06', 2),
    ('Paulo Freire', 19 , '2017-01-06', 3),
    ('Bell Hooks', 26 , '2017-01-06', 3),
    ('Christopher Alexander', 85 , '2017-01-06', 4),
    ('Judith Butler', 45 , '2017-01-06', 4),
    ('Jorge Amado', 58 , '2017-01-06', 4);

      INSERT INTO SpotifyClone.Historico_reproducao (cancoes_id, user_id, data_reproducao)
  VALUES
    (8, 1 , '2022-02-28 10:45:55'),
    (2, 1 , '2020-05-02 05:30:35'),
    (10, 1 , '2020-03-06 11:22:33'),
    (10, 2 , '2022-08-05 08:05:17'),
    (7, 2 , '2020-01-02 07:40:33'),
    (10, 3 ,'2020-11-13 16:55:13'),
    (2, 3 , '2020-12-05 18:38:30'),
    (8, 4 , '2021-08-15 17:10:10'),
    (8, 5 , '2022-01-09 01:44:33'),
    (5, 5 , '2020-08-06 15:23:43'),
    (7, 6 , '2017-01-24 00:31:17'),
    (1, 6 , '2017-10-12 12:35:20'),
    (4, 7 , '2011-12-15 22:30:49'),
    (4, 8 , '2012-03-17 14:56:41'),
    (9, 9 , '2022-02-24 21:14:22'),
    (3, 10 , '2015-12-13 08:30:22');

          INSERT INTO SpotifyClone.Artista_seguidos (artista_id, user_id)
  VALUES
    (1, 1 ),
    (2, 1 ),
    (3, 1 ),
    (1, 2 ),
    (2, 2 ),
    (2, 3 ),
    (4, 4 ),
    (5, 5 ),
    (6, 5 ),
    (6, 6 ),
    (1, 6 ),
    (6, 7 ),
    (3, 9 ),
    (2, 10 );



