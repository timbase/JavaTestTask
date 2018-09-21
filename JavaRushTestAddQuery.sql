USE test;

DROP TABLE IF EXISTS part;
CREATE TABLE part(
  ID INT(11) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL,
  IS_NEEDED BIT(1) NOT NULL,
  AMOUNT INT NOT NULL DEFAULT 0,
  PRIMARY KEY(ID))

  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO part(NAME, IS_NEEDED, AMOUNT)
VALUES('материнская плата', 1,'30'),
      ('звуковая карта', 0,'12'),
      ('процессор', 1,'70'),
      ('система охлаждения', 1,'67'),
      ('подсветка корпуса', 0,'9'),
      ('HDD диск', 0,'34'),
      ('корпус', 1,'56'),
      ('картридер', 0,'25'),
      ('память', 1,'78'),
      ('TV-карта', 0,'43'),
      ('SSD диск', 1,'98'),
      ('шлейфы', 1,'65'),
      ('DVD', 0,'3'),
      ('блок питания', 1,'45'),
      ('клавиатура', 1,'89'),
      ('монитор', 1,'72'),
      ('оптическая мышь', 1,'68'),
      ('модем', 0,'99'),
      ('принтер', 0,'47'),
      ('сканер', 0,'12'),
      ('видеокарта', 1,'100');

COMMIT;