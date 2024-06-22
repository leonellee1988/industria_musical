-- Configuraciones especiales

DROP TABLE usuario;
DROP TABLE lista_reproduccion;

TRUNCATE TABLE lista_reproduccion;
TRUNCATE TABLE usuario;

-- Creación de tablas y relaciones:

CREATE TABLE genero_musical(
id_genero BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre_genero VARCHAR(50)
);

CREATE TABLE artista(
id_artista BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre_artista VARCHAR(50),
pais_origen VARCHAR(50)
);

CREATE TABLE album(
id_album BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre_album VARCHAR(50),
fecha_lanzamiento DATE,
id_genero BIGINT,
id_artista BIGINT,
FOREIGN KEY(id_genero) REFERENCES genero_musical(id_genero),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE cancion(
id_cancion BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre_cancion VARCHAR(50),
duracion_minutos DECIMAL(10,2),
id_genero BIGINT,
id_artista BIGINT,
id_album BIGINT,
FOREIGN KEY (id_genero) REFERENCES genero_musical(id_genero),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
FOREIGN KEY (id_album) REFERENCES album(id_album)
);

CREATE TABLE usuario(
id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre_usuario VARCHAR(50),
email_usuario VARCHAR(50),
fecha_nacimiento DATE,
fecha_registro DATE
);

CREATE TABLE lista_reproduccion(
id_lista BIGINT AUTO_INCREMENT PRIMARY KEY,
id_usuario BIGINT,
id_cancion BIGINT
);

--- Introducción de registros:

INSERT INTO genero_musical (nombre_genero)
VALUES
    ('Rock'),
    ('Anime'),
    ('Rancheras'),
    ('Románticas'),
    ('Pop');

-- Rock
INSERT INTO artista (nombre_artista, pais_origen)
VALUES
    ('Queen', 'Reino Unido'),
    ('The Beatles', 'Reino Unido'),
    ('Led Zeppelin', 'Reino Unido'),
    ('Pink Floyd', 'Reino Unido'),
    ('U2', 'Irlanda');

-- Anime
INSERT INTO artista (nombre_artista, pais_origen)
VALUES
    ('Sukima Switch', 'Japón'),
    ('LiSA', 'Japón'),
    ('Yoko Kanno', 'Japón'),
    ('Joe Hisaishi', 'Japón'),
    ('Kalafina', 'Japón');

-- Rancheras
INSERT INTO artista (nombre_artista, pais_origen)
VALUES
    ('Bronco', 'México'),
    ('Vicente Fernández', 'México'),
    ('Alejandro Fernández', 'México'),
    ('Antonio Aguilar', 'México'),
    ('Pedro Infante', 'México');

-- Románticas
INSERT INTO artista (nombre_artista, pais_origen)
VALUES
    ('Adele', 'Reino Unido'),
    ('Whitney Houston', 'Estados Unidos'),
    ('Celine Dion', 'Canadá'),
    ('Ed Sheeran', 'Reino Unido'),
    ('Mariah Carey', 'Estados Unidos');

-- Pop
INSERT INTO artista (nombre_artista, pais_origen)
VALUES
    ('Taylor Swift', 'Estados Unidos'),
    ('Madonna', 'Estados Unidos'),
    ('Michael Jackson', 'Estados Unidos'),
    ('Beyoncé', 'Estados Unidos'),
    ('Bruno Mars', 'Estados Unidos');

-- Álbumes para Queen
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Greatest Hits', '1981-10-26', 1, 1),
    ('A Night at the Opera', '1975-11-21', 1, 1);

-- Álbumes para The Beatles
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Abbey Road', '1969-09-26', 1, 2),
    ('Sgt. Pepper\'s Lonely Hearts Club Band', '1967-06-01', 1, 2);

-- Álbumes para Led Zeppelin
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Led Zeppelin IV', '1971-11-08', 1, 3),
    ('Physical Graffiti', '1975-02-24', 1, 3);

-- Álbumes para Pink Floyd
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('The Dark Side of the Moon', '1973-03-01', 1, 4),
    ('The Wall', '1979-11-30', 1, 4);

-- Álbumes para U2
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('The Joshua Tree', '1987-03-09', 1, 5),
    ('Achtung Baby', '1991-11-18', 1, 5);

-- Álbumes para Sukima Switch
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Natsugumo Noise', '2004-06-16', 2, 6),
    ('Kanade', '2004-03-10', 2, 6);

-- Álbumes para LiSA
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Launcher', '2015-03-04', 2, 7),
    ('Leo-Nine', '2020-10-14', 2, 7);

-- Álbumes para Yoko Kanno
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Cowboy Bebop OST', '1998-05-21', 2, 8),
    ('Macross Frontier OST', '2008-06-04', 2, 8);

-- Álbumes para Joe Hisaishi
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Spirited Away OST', '2001-07-18', 2, 9),
    ('My Neighbor Totoro OST', '1988-01-01', 2, 9);

-- Álbumes para Kalafina
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Seventh Heaven', '2009-03-04', 2, 10),
    ('After Eden', '2011-09-21', 2, 10);

-- Álbumes para Bronco
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Por el Mundo', '1993-06-15', 3, 11),
    ('Amigo', '1991-06-11', 3, 11);

-- Álbumes para Vicente Fernández
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Para Siempre', '2007-09-25', 3, 12),
    ('Historias de un Idolo', '2000-08-01', 3, 12);

-- Álbumes para Alejandro Fernández
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Rompiendo Fronteras', '2017-02-10', 3, 13),
    ('Confidencias', '2013-08-27', 3, 13);

-- Álbumes para Antonio Aguilar
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Caballo Prieto Azabache', '1972-07-15', 3, 14),
    ('Puno de Tierra', '1983-05-01', 3, 14);

-- Álbumes para Pedro Infante
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('100 Años', '1956-05-01', 3, 15),
    ('Las Mañanitas', '1950-10-15', 3, 15);

-- Álbumes para Adele
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('21', '2011-01-24', 4, 16),
    ('25', '2015-11-20', 4, 16);

-- Álbumes para Whitney Houston
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Whitney Houston', '1985-02-14', 4, 17),
    ('The Bodyguard', '1992-11-17', 4, 17);

-- Álbumes para Celine Dion
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Falling into You', '1996-03-12', 4, 18),
    ('Let\'s Talk About Love', '1997-11-18', 4, 18);

-- Álbumes para Ed Sheeran
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('+', '2011-09-09', 4, 19),
    ('x', '2014-06-20', 4, 19);

-- Álbumes para Mariah Carey
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Music Box', '1993-08-31', 4, 20),
    ('Daydream', '1995-10-03', 4, 20);

-- Álbumes para Taylor Swift
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('1989', '2014-10-27', 5, 21),
    ('Red', '2012-10-22', 5, 21);

-- Álbumes para Madonna
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Like a Virgin', '1984-11-12', 5, 22),
    ('Ray of Light', '1998-03-03', 5, 22);

-- Álbumes para Michael Jackson
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Thriller', '1982-11-30', 5, 23),
    ('Bad', '1987-08-31', 5, 23);

-- Álbumes para Beyoncé
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Dangerously in Love', '2003-06-24', 5, 24),
    ('Beyoncé', '2013-12-13', 5, 24);

-- Álbumes para Bruno Mars
INSERT INTO album (nombre_album, fecha_lanzamiento, id_genero, id_artista)
VALUES 
    ('Doo-Wops & Hooligans', '2010-10-05', 5, 25),
    ('24K Magic', '2016-11-18', 5, 25);
    
-- Canciones para cada álbum

-- Álbumes de Queen
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Bohemian Rhapsody', 5.55, 1, 1, 1),
    ('Another One Bites the Dust', 3.35, 1, 1, 1),
    ('Love of My Life', 3.38, 1, 1, 2),
    ('You\'re My Best Friend', 2.52, 1, 1, 2);

-- Álbumes de The Beatles
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Come Together', 4.20, 1, 2, 3),
    ('Something', 3.03, 1, 2, 3),
    ('Lucy in the Sky with Diamonds', 3.28, 1, 2, 4),
    ('A Day in the Life', 5.39, 1, 2, 4);

-- Álbumes de Led Zeppelin
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Stairway to Heaven', 8.02, 1, 3, 5),
    ('Black Dog', 4.55, 1, 3, 5),
    ('Kashmir', 8.37, 1, 3, 6),
    ('Trampled Under Foot', 5.36, 1, 3, 6);

-- Álbumes de Pink Floyd
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Money', 6.22, 1, 4, 7),
    ('Time', 7.05, 1, 4, 7),
    ('Comfortably Numb', 6.24, 1, 4, 8),
    ('Hey You', 4.40, 1, 4, 8);

-- Álbumes de U2
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('With or Without You', 4.56, 1, 5, 9),
    ('I Still Haven\'t Found What I\'m Looking For', 4.37, 1, 5, 9),
    ('One', 4.36, 1, 5, 10),
    ('Mysterious Ways', 4.03, 1, 5, 10);

-- Álbumes de Sukima Switch
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Kanade', 5.25, 2, 6, 11),
    ('Guarana', 4.11, 2, 6, 11),
    ('Zenryoku Shounen', 4.28, 2, 6, 12),
    ('Golden Time Lover', 4.12, 2, 6, 12);

-- Álbumes de LiSA
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Gurenge', 3.57, 2, 7, 13),
    ('Crossing Field', 4.10, 2, 7, 13),
    ('Unlasting', 4.38, 2, 7, 14),
    ('Homura', 4.30, 2, 7, 14);

-- Álbumes de Yoko Kanno
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Tank!', 3.30, 2, 8, 15),
    ('The Real Folk Blues', 5.30, 2, 8, 15),
    ('What Planet is This?', 2.45, 2, 8, 16),
    ('Inner Universe', 4.54, 2, 8, 16);

-- Álbumes de Joe Hisaishi
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('One Summer\'s Day', 3.10, 2, 9, 17),
    ('Reprise', 4.32, 2, 9, 17),
    ('The Path of Wind', 3.16, 2, 9, 18),
    ('A Town with an Ocean View', 3.02, 2, 9, 18);

-- Álbumes de Kalafina
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Hikari no Senritsu', 5.25, 2, 10, 19),
    ('Lacrimosa', 4.34, 2, 10, 19),
    ('Magia', 5.13, 2, 10, 20),
    ('Seventh Heaven', 6.00, 2, 10, 20);

-- Álbumes de Bronco
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Sergio el Bailador', 3.15, 3, 11, 21),
    ('Que No Quede Huella', 3.40, 3, 11, 21),
    ('Amigo Bronco', 3.30, 3, 11, 22),
    ('Adoro', 3.27, 3, 11, 22);

-- Álbumes de Vicente Fernández
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Volver Volver', 3.37, 3, 12, 23),
    ('El Rey', 2.43, 3, 12, 23),
    ('Mujeres Divinas', 2.57, 3, 12, 24),
    ('Acá Entre Nos', 3.12, 3, 12, 24);

-- Álbumes de Alejandro Fernández
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Me Dediqué a Perderte', 3.58, 3, 13, 25),
    ('Si Tú Supieras', 3.38, 3, 13, 25),
    ('Hoy Tengo Ganas de Ti', 4.38, 3, 13, 26),
    ('Se Me Va la Voz', 3.57, 3, 13, 26);

-- Álbumes de Antonio Aguilar
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Tristes Recuerdos', 3.48, 3, 14, 27),
    ('Albur de Amor', 2.50, 3, 14, 27),
    ('Caballo Prieto Azabache', 3.33, 3, 14, 28),
    ('La Chancla', 3.01, 3, 14, 28);

-- Álbumes de Pedro Infante
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Amorcito Corazón', 2.50, 3, 15, 29),
    ('Cien Años', 2.40, 3, 15, 29),
    ('El Mil Amores', 3.10, 3, 15, 30),
    ('La que se Fue', 2.50, 3, 15, 30);

-- Álbumes de Adele
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Rolling in the Deep', 3.48, 4, 16, 31),
    ('Someone Like You', 4.45, 4, 16, 31),
    ('Hello', 4.55, 4, 16, 32),
    ('Send My Love', 3.43, 4, 16, 32);

-- Álbumes de Whitney Houston
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('I Will Always Love You', 4.31, 4, 17, 33),
    ('Greatest Love of All', 4.55, 4, 17, 33),
    ('I Wanna Dance with Somebody', 4.52, 4, 17, 34),
    ('How Will I Know', 4.36, 4, 17, 34);

-- Álbumes de Celine Dion
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('My Heart Will Go On', 4.40, 4, 18, 35),
    ('Because You Loved Me', 4.35, 4, 18, 35),
    ('The Power of Love', 4.47, 4, 18, 36),
    ('It\'s All Coming Back to Me Now', 5.20, 4, 18, 36);

-- Álbumes de Ed Sheeran
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Shape of You', 3.53, 4, 19, 37),
    ('Perfect', 4.23, 4, 19, 37),
    ('Thinking Out Loud', 4.41, 4, 19, 38),
    ('Photograph', 4.18, 4, 19, 38);

-- Álbumes de Mariah Carey
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Hero', 4.20, 4, 20, 39),
    ('Without You', 3.36, 4, 20, 39),
    ('All I Want for Christmas Is You', 4.01, 4, 20, 40),
    ('We Belong Together', 3.23, 4, 20, 40);

-- Álbumes de Taylor Swift
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Shake It Off', 3.39, 5, 21, 41),
    ('Blank Space', 3.51, 5, 21, 41),
    ('Red', 3.43, 5, 21, 42),
    ('I Knew You Were Trouble', 3.39, 5, 21, 42);

-- Álbumes de Madonna
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Like a Prayer', 5.41, 5, 22, 43),
    ('Vogue', 5.16, 5, 22, 43),
    ('Frozen', 6.10, 5, 22, 44),
    ('Ray of Light', 5.21, 5, 22, 44);

-- Álbumes de Michael Jackson
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Billie Jean', 4.54, 5, 23, 45),
    ('Thriller', 5.57, 5, 23, 45),
    ('Bad', 4.07, 5, 23, 46),
    ('Smooth Criminal', 4.17, 5, 23, 46);

-- Álbumes de Beyoncé
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Crazy in Love', 3.56, 5, 24, 47),
    ('Baby Boy', 4.05, 5, 24, 47),
    ('Drunk in Love', 5.23, 5, 24, 48),
    ('Partition', 5.19, 5, 24, 48);

-- Álbumes de Bruno Mars
INSERT INTO cancion (nombre_cancion, duracion_minutos, id_genero, id_artista, id_album)
VALUES
    ('Just the Way You Are', 3.40, 5, 25, 49),
    ('Grenade', 3.42, 5, 25, 49),
    ('24K Magic', 3.46, 5, 25, 50),
    ('That\'s What I Like', 3.26, 5, 25, 50);
    
-- Usuarios tomando en cuenta su edad

-- Usuarios entre 81 a 90 años (2 usuarios)
INSERT INTO usuario (nombre_usuario, email_usuario, fecha_nacimiento, fecha_registro)
VALUES
    ('Euclides', 'euclides@matematicos.com', '1942-06-23', '2024-01-01'),
    ('Pitágoras', 'pitagoras@matematicos.com', '1938-03-15', '2024-01-02');

-- Usuarios entre 71 a 80 años (3 usuarios)
INSERT INTO usuario (nombre_usuario, email_usuario, fecha_nacimiento, fecha_registro)
VALUES
    ('Arquímedes', 'arquimedes@matematicos.com', '1949-07-20', '2024-01-03'),
    ('Isaac Newton', 'newton@matematicos.com', '1948-01-04', '2024-01-04'),
    ('Carl Gauss', 'gauss@matematicos.com', '1948-04-30', '2024-01-05');

-- Usuarios entre 51 a 70 años (5 usuarios)
INSERT INTO usuario (nombre_usuario, email_usuario, fecha_nacimiento, fecha_registro)
VALUES
    ('Leonhard Euler', 'euler@matematicos.com', '1957-04-15', '2024-01-06'),
    ('Pierre-Simon Laplace', 'laplace@matematicos.com', '1965-03-23', '2024-01-07'),
    ('Joseph Fourier', 'fourier@matematicos.com', '1965-03-21', '2024-01-08'),
    ('Bernhard Riemann', 'riemann@matematicos.com', '1968-09-17', '2024-01-10'),
    ('Henri Poincaré', 'poincare@matematicos.com', '1965-04-29', '2024-01-11');

-- Usuarios entre 21 a 50 años (10 usuarios)
INSERT INTO usuario (nombre_usuario, email_usuario, fecha_nacimiento, fecha_registro)
VALUES
    ('David Hilbert', 'hilbert@matematicos.com', '1992-01-23', '2024-01-12'),
    ('Emmy Noether', 'noether@matematicos.com', '1988-03-23', '2024-01-13'),
    ('John von Neumann', 'neumann@matematicos.com', '1988-12-28', '2024-01-14'),
    ('Alan Turing', 'turing@matematicos.com', '1989-06-23', '2024-01-15'),
    ('Kurt Gödel', 'godel@matematicos.com', '1986-04-28', '2024-01-16'),
    ('Srinivasa Ramanujan', 'ramanujan@matematicos.com', '1994-12-22', '2024-01-17'),
    ('Blaise Pascal', 'pascal@matematicos.com', '1988-06-19', '2024-01-18'),
    ('René Descartes', 'descartes@matematicos.com', '1976-03-31', '2024-01-19'),
    ('Niels Bohr', 'bohr@matematicos.com', '1981-10-07', '2024-01-20'),
    ('Leonardo Fibonacci', 'fibonacci@matematicos.com', '1988-01-01', '2024-01-21');

-- Usuarios entre 15 a 20 años (5 usuarios)
INSERT INTO usuario (nombre_usuario, email_usuario, fecha_nacimiento, fecha_registro)
VALUES
    ('Paul Erdos', 'erdos@matematicos.com', '2005-03-26', '2024-01-22'),
    ('Andrey Kolmogorov', 'kolmogorov@matematicos.com', '2007-04-25', '2024-01-23'),
    ('Sofia Kovalevskaya', 'kovalevskaya@matematicos.com', '2006-01-15', '2024-01-24'),
    ('Alexandre Grothendieck', 'grothendieck@matematicos.com', '2008-03-28', '2024-01-25'),
    ('Joseph Fourier', 'fourier@matematicos.com', '2006-03-21', '2024-01-08');

-- Para cada usuario (1-25), insertar 10 canciones

-- Usuario 1
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 21), (1, 22), (1, 41), (1, 42), (1, 61), (1, 71);

-- Usuario 2
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(2, 5), (2, 6), (2, 11), (2, 8), (2, 23), (2, 24), (2, 43), (2, 44), (2, 62), (2, 72);

-- Usuario 3
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(3, 9), (3, 10), (3, 11), (3, 12), (3, 25), (3, 1), (3, 45), (3, 46), (3, 63), (3, 73);

-- Usuario 4
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(4, 13), (4, 14), (4, 100), (4, 16), (4, 27), (4, 94), (4, 47), (4, 48), (4, 64), (4, 74);

-- Usuario 5
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(5, 17), (5, 18), (5, 19), (5, 20), (5, 29), (5, 30), (5, 49), (5, 50), (5, 65), (5, 75);

-- Usuario 6
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(6, 1), (6, 72), (6, 3), (6, 4), (6, 31), (6, 32), (6, 51), (6, 52), (6, 66), (6, 71);

-- Usuario 7
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(7, 5), (7, 6), (7, 7), (7, 1), (7, 33), (7, 34), (7, 53), (7, 54), (7, 67), (7, 72);

-- Usuario 8
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(8, 72), (8, 10), (8, 11), (8, 12), (8, 35), (8, 36), (8, 55), (8, 56), (8, 68), (8, 73);

-- Usuario 9
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(9, 13), (9, 14), (9, 15), (9, 16), (9, 37), (9, 38), (9, 57), (9, 58), (9, 69), (9, 74);

-- Usuario 10
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(10, 99), (10, 18), (10, 19), (10, 11), (10, 87), (10, 40), (10, 59), (10, 60), (10, 70), (10, 75);

-- Usuario 11
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(11, 1), (11, 2), (11, 3), (11, 4), (11, 72), (11, 22), (11, 41), (11, 42), (11, 61), (11, 71);

-- Usuario 12
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(12, 5), (12, 6), (12, 7), (12, 8), (12, 1), (12, 24), (12, 43), (12, 44), (12, 62), (12, 72);

-- Usuario 13
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(13, 9), (13, 10), (13, 11), (13, 12), (13, 25), (13, 26), (13, 45), (13, 46), (13, 63), (13, 73);

-- Usuario 14
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(14, 13), (14, 14), (14, 15), (14, 16), (14, 27), (14, 28), (14, 47), (14, 48), (14, 64), (14, 74);

-- Usuario 15
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(15, 17), (15, 18), (15, 1), (15, 20), (15, 29), (15, 30), (15, 49), (15, 50), (15, 65), (15, 75);

-- Usuario 16
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(16, 1), (16, 10), (16, 3), (16, 4), (16, 31), (16, 32), (16, 51), (16, 52), (16, 66), (16, 71);

-- Usuario 17
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(17, 99), (17, 6), (17, 1), (17, 83), (17, 33), (17, 34), (17, 53), (17, 54), (17, 67), (17, 72);

-- Usuario 18
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(18, 9), (18, 10), (18, 11), (18, 12), (18, 35), (18, 36), (18, 55), (18, 56), (18, 68), (18, 73);

-- Usuario 19
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(19, 13), (19, 14), (19, 15), (19, 16), (19, 37), (19, 38), (19, 57), (19, 58), (19, 69), (19, 74);

-- Usuario 20
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(20, 100), (20, 18), (20, 19), (20, 85), (20, 39), (20, 40), (20, 59), (20, 60), (20, 70), (20, 75);

-- Usuario 21
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(21, 1), (21, 2), (21, 88), (21, 4), (21, 21), (21, 22), (21, 41), (21, 42), (21, 61), (21, 71);

-- Usuario 22
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(22, 5), (22, 6), (22, 10), (22, 8), (22, 23), (22, 24), (22, 43), (22, 44), (22, 62), (22, 72);

-- Usuario 23
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(23, 9), (23, 10), (23, 11), (23, 12), (23, 25), (23, 26), (23, 45), (23, 46), (23, 63), (23, 73);

-- Usuario 24
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(24, 1), (24, 90), (24, 15), (24, 16), (24, 97), (24, 28), (24, 47), (24, 48), (24, 64), (24, 74);

-- Usuario 25
INSERT INTO lista_reproduccion (id_usuario, id_cancion) VALUES 
(25, 10), (25, 18), (25, 19), (25, 20), (25, 29), (25, 100), (25, 49), (25, 50), (25, 65), (25, 75);

SELECT * FROM cancion;