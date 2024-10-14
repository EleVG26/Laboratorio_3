DO $$
DECLARE totalPaises INTEGER;
		nuevoIdCampeonato INTEGER; nuevoIdGrupo INTEGER; nuevoIdPais INTEGER; 
		nuevoIdCiudad INTEGER; nuevoIdEstadio INTEGER; nuevoIdEncuentro INTEGER;	
		IdPais1 INTEGER; IdPais2 INTEGER; IdPais3 INTEGER; IdPais4 INTEGER;
		IdMedellin INTEGER;  IdCali INTEGER; IdBogota INTEGER; IdColombia INTEGER;
		IdEstadio1 INTEGER; IdEstadio2 INTEGER; IdEstadio3 INTEGER; IdEstadio4 INTEGER;

BEGIN
	
	SELECT MAX(Id)+1 INTO nuevoIdPais
		FROM pais; --Hallar el nuevo Id para pais

	--valIdar si ya está el campeonato
	SELECT Id INTO nuevoIdCampeonato 
		FROM campeonato 
		WHERE campeonato = 'FIFA U-20 Women`s World Cup Colombia 2024';
	IF nuevoIdCampeonato  IS NULL THEN
		SELECT MAX(Id)+1 INTO nuevoIdCampeonato FROM Campeonato; --Hallar el nuevo Id para campeonato
		INSERT INTO Campeonato 
			(Id,Campeonato, IdPais, Año) 
			VALUES(nuevoIdCampeonato, 'FIFA U-20 Women`s World Cup Colombia 2024',   1, 2024);
	END IF;

	--valIdar si ya estan los grupos
	SELECT Id INTO nuevoIdGrupo
		FROM grupo
		WHERE IdCampeonato = nuevoIdCampeonato
			AND grupo= 'A';
	IF nuevoIdGrupo IS NULL THEN
		SELECT MAX(Id)+1 INTO nuevoIdGrupo FROM Grupo; --Hallar el nuevo Id para grupo
		
		INSERT INTO Grupo
			(Id, Grupo, IdCampeonato)
			VALUES
			(nuevoIdGrupo,  'A',nuevoIdCampeonato),
			(nuevoIdGrupo+1,'B',nuevoIdCampeonato),
			(nuevoIdGrupo+2,'C',nuevoIdCampeonato),
			(nuevoIdGrupo+3,'D',nuevoIdCampeonato),
			(nuevoIdGrupo+4,'E',nuevoIdCampeonato),
			(nuevoIdGrupo+5,'F',nuevoIdCampeonato);
	END IF;
		
	SELECT Id INTO IdPais1 FROM pais WHERE pais='Colombia';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Colombia', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;
	END IF;
	IdColombia := IdPais1;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Australia';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Australia', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Camerún';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Camerún', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Mexico';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Mexico', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo, IdPais1),
			(nuevoIdGrupo, IdPais2),
			(nuevoIdGrupo, IdPais3),
			(nuevoIdGrupo, IdPais4);
	END IF;
	
	SELECT Id INTO IdPais1 FROM pais WHERE pais='Francia';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Francia', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Canadá';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Canadá', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Brasil';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Brasil', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Fiyi';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Fiyi', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+1;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+1, IdPais1),
			(nuevoIdGrupo+1, IdPais2),
			(nuevoIdGrupo+1, IdPais3),
			(nuevoIdGrupo+1, IdPais4);

	END IF;
	SELECT Id INTO IdPais1 FROM pais WHERE pais='España';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'España', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Estados UnIdos';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Estados UnIdos', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Paraguay';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Paraguay', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Marruecos';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Marruecos', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+2;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+2, IdPais1),
			(nuevoIdGrupo+2, IdPais2),
			(nuevoIdGrupo+2, IdPais3),
			(nuevoIdGrupo+2, IdPais4);

	END IF;
	SELECT Id INTO IdPais1 FROM pais WHERE pais='Alemania';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Alemania', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Venezuela';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Venezuela', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Nigeria';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Nigeria', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Rep. Corea';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Rep. Corea', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+3;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+3, IdPais1),
			(nuevoIdGrupo+3, IdPais2),
			(nuevoIdGrupo+3, IdPais3),
			(nuevoIdGrupo+3, IdPais4);

	END IF;
	SELECT Id INTO IdPais1 FROM pais WHERE pais='Japón';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Japón', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Nueva Zelanda';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Nueva Zelanda', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Ghana';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Ghana', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Austria';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Austria', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+4;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+4, IdPais1),
			(nuevoIdGrupo+4, IdPais2),
			(nuevoIdGrupo+4, IdPais3),
			(nuevoIdGrupo+4, IdPais4);

	END IF;

	SELECT Id INTO IdPais1 FROM pais WHERE pais='RPD de Corea';
	IF IdPais1 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'RPD de Corea', '');
		IdPais1 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais2 FROM pais WHERE pais='Argentina';
	IF IdPais2 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Argentina', '');
		IdPais2 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais3 FROM pais WHERE pais='Costa Rica';
	IF IdPais3 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Costa Rica', '');
		IdPais3 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais4 FROM pais WHERE pais='Paises Bajos';
	IF IdPais4 IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Paises Bajos', '');
		IdPais4 := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+5;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+5, IdPais1),
			(nuevoIdGrupo+5, IdPais2),
			(nuevoIdGrupo+5, IdPais3),
			(nuevoIdGrupo+5, IdPais4);

	END IF;
	SELECT MAX(Id)+1 INTO nuevoIdCiudad --inicializar los Id
		FROM ciudad;
	SELECT MAX(Id)+1 INTO nuevoIdEstadio
		FROM estadio;
	
	SELECT Id INTO IdEstadio1 FROM estadio WHERE estadio='Estadio Atanasio Girardot';
	IF IdEstadio1 IS NULL THEN	
	
		SELECT Id INTO IdMedellin FROM ciudad WHERE ciudad='Medellin';
		IF IdMedellin IS NULL THEN
			INSERT INTO ciudad
				(Id, ciudad, IdPais ) VALUES(nuevoIdCiudad, 'Medellín', IdColombia);
			IdMedellin := nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad +1;
		END IF;
		INSERT INTO estadio--actualizar tabla estadio
				(Id, estadio, capacIdad, IdCiudad ) VALUES(nuevoIdEstadio, 'Estadio Atanasio Girardot',0,  IdMedellin);
		IdEstadio1 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio +1;
		
	END IF;

	SELECT Id INTO IdEstadio2 FROM estadio WHERE estadio='Estadio Olimpico Pascual Guerrero';
	IF IdEstadio2 IS NULL THEN	
	
		SELECT Id INTO IdCali FROM ciudad WHERE ciudad='Cali';
		IF IdCali IS NULL THEN
			INSERT INTO ciudad
				(Id, ciudad, IdPais ) VALUES(nuevoIdCiudad, 'Cali', IdColombia);
			IdCali := nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad +1;
		END IF;
		INSERT INTO estadio--actualizar tabla estadio
				(Id, estadio, capacIdad, IdCiudad ) VALUES(nuevoIdEstadio, 'Estadio Olimpico Pascual Guerrero',0,  IdCali);
		IdEstadio2 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio +1;
	END IF;

	SELECT Id INTO IdEstadio3 FROM estadio WHERE estadio='Estadio Nemesio Camacho El Campín';
	IF IdEstadio3 IS NULL THEN	
		SELECT Id INTO IdBogota FROM ciudad WHERE ciudad='Bogotá';
		IF IdBogota IS NULL THEN
			INSERT INTO ciudad
				(Id, ciudad, IdPais ) VALUES(nuevoIdCiudad, 'Bogotá', IdColombia);
			IdBogota := nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad +1;
		END IF;
		INSERT INTO estadio--actualizar tabla estadio
				(Id, estadio, capacIdad, IdCiudad ) VALUES(nuevoIdEstadio, 'Estadio Nemesio Camacho El Campín',0,  IdBogota);
		IdEstadio3 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio +1;
	END IF;

	SELECT Id INTO IdEstadio4 FROM estadio WHERE estadio='Estadio Metropolitano de Techo';
	IF IdEstadio4 IS NULL THEN
		SELECT Id INTO IdBogota FROM ciudad WHERE ciudad='Bogotá';
	
		INSERT INTO estadio--actualizar tabla estadio
				(Id, estadio, capacIdad, IdCiudad ) VALUES(nuevoIdEstadio, 'Estadio Metropolitano de Techo',0,  IdBogota);
		IdEstadio4 := nuevoIdEstadio;
	END IF;
END $$;


--consulta de prueba para mirar los datos que se van agregando
SELECT c.Id, c.campeonato, p.pais, g.grupo, g.Id, pg.Id, pg.pais
	FROM campeonato c
		JOIN grupo g ON g.Idcampeonato=c.Id
		JOIN pais p ON c.Idpais=p.Id --saber el país que organizó el campeonato
		LEFT JOIN grupopais gp ON gp.Idgrupo = g.Id
		LEFT JOIN pais pg ON pg.Id = gp.Idpais --conocer el pais en el grupo
		WHERE Campeonato='FIFA U-20 Women`s World Cup Colombia 2024';

SELECT * FROM estadio e
			JOIN ciudad c ON e.IdCiudad=c.Id
		 WHERE IdPais=1

SELECT * 
	FROM Campeonato c
		JOIN grupo g ON g.Idcampeonato=c.Id
		WHERE c.Id>=12
		WHERE Campeonato='FIFA U-20 Women`s World Cup Colombia 2024';
		
select * from campeonato
delete from Campeonato where Campeonato= 'FIFA U-20 Women`s World Cup Colombia 2024'
delete from Campeonato where Id>=12
delete from grupo where IdCampeonato>=12



