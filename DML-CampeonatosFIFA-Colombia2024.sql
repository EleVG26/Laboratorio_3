DO $$
DECLARE totalPaises INTEGER;
		nuevoIdCampeonato INTEGER; nuevoIdGrupo INTEGER; nuevoIdPais INTEGER; 
		nuevoIdCiudad INTEGER; nuevoIdEstadio INTEGER; nuevoIdEncuentro INTEGER;	
		IdPais1Grupo INTEGER; IdPais2Grupo INTEGER; IdPais3Grupo INTEGER; IdPais4Grupo INTEGER;
		IdMedellin INTEGER;  IdCali INTEGER; IdBogota INTEGER; IdColombia INTEGER;
		IdEstadio1 INTEGER; IdEstadio2 INTEGER; IdEstadio3 INTEGER; IdEstadio4 INTEGER;

BEGIN
	
	SELECT MAX(Id)+1 INTO nuevoIdPais
		FROM pais; --Hallar el nuevo Id para pais

	SELECT Id INTO IdColombia FROM pais WHERE pais='Colombia';
	IF IdColombia IS NULL THEN
		INSERT INTO pais
			(Id, pais, entidad ) VALUES(nuevoIdPais, 'Colombia', '');
		IdColombia := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;
	
	END IF;
	

	--valIdar si ya está el campeonato
	SELECT Id INTO nuevoIdCampeonato 
		FROM campeonato 
		WHERE campeonato = 'FIFA U-20 Women`s World Cup Colombia 2024';
	IF nuevoIdCampeonato  IS NULL THEN
		SELECT MAX(Id)+1 INTO nuevoIdCampeonato FROM Campeonato; --Hallar el nuevo Id para campeonato
		INSERT INTO Campeonato 
			(Id,Campeonato, IdPais, Año) 
			VALUES(nuevoIdCampeonato, 'FIFA U-20 Women`s World Cup Colombia 2024',   IdColombia , 2024);
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
		
	IdPais1Grupo := IdColombia;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Australia';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Australia', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Camerún';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Camerún', '');
		IdPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Mexico';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Mexico', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo, IdPais1Grupo),
			(nuevoIdGrupo, IdPais2Grupo),
			(nuevoIdGrupo, IdPais3Grupo),
			(nuevoIdGrupo, IdPais4Grupo);
	END IF;

	SELECT MAX(Id)+1 INTO nuevoIdEncuentro
		FROM encuentro;
	-- Camerun vs Mexico
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,2, IdPais4Grupo, 2, '2024-08-31', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	-- Colombia vs Australia

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,2, IdPais2Grupo, 0, '2024-08-31', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	-- Mexico vs Australia

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,2, IdPais2Grupo, 0, '2024-09-03', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Colombia vs Camerún

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,1, IdPais3Grupo, 0, '2024-09-03', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Mexico vs Colombia
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais1Grupo, 1, '2024-09-06', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Australia vs Camerún
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,0, IdPais3Grupo, 2, '2024-09-06', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	SELECT Id INTO IdPais1Grupo FROM pais WHERE pais='Francia';
	IF IdPais1Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Francia', '');
		IdPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Canadá';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Canadá', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Brasil';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Brasil', '');
		IdPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Fiyi';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Fiyi', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +1;

	END IF;
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+1;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+1, IdPais1Grupo),
			(nuevoIdGrupo+1, IdPais2Grupo),
			(nuevoIdGrupo+1, IdPais3Grupo),
			(nuevoIdGrupo+1, IdPais4Grupo);
	END IF;

	-- Francia1 vs Canadá2 
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,3, IdPais2Grupo, 3, '2024-08-31', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	-- Brasil3 vs Fiyi4

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,9, IdPais4Grupo, 0, '2024-08-31', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	-- Francia1 vs Brasil3

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,0, IdPais3Grupo, 3, '2024-09-03', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Fiyi4 vs Canadá2

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais2Grupo, 9, '2024-09-03', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Fiyi4 vs Francia1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais1Grupo, 11, '2024-09-06', IdEstadio1, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	-- Canadá2 vs Brasil3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,0, IdPais3Grupo, 2, '2024-09-06', IdEstadio3, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	SELECT Id INTO IdPais1Grupo FROM pais WHERE pais='España';
	IF IdPais1Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'España', '');
		IdPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Estados UnIdos';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Estados UnIdos', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Paraguay';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Paraguay', '');
		IdPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Marruecos';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Marruecos', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +2;

	END IF;
	
	
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+2;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+2, IdPais1Grupo),
			(nuevoIdGrupo+2, IdPais2Grupo),
			(nuevoIdGrupo+2, IdPais3Grupo),
			(nuevoIdGrupo+2, IdPais4Grupo);

	END IF;
	
	--España1 vs Estados Unidos2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,1, IdPais2Grupo, 0, '2024-09-01', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	--Paraguay3 vs Marruecos4

	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,2, IdPais4Grupo, 0, '2024-09-01', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	--España1 vs Paraguay3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,2, IdPais3Grupo, 0, '2024-09-04', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	--Marruecos4 vs Estados Unidos2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais2Grupo, 2, '2024-09-04', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	--Marruecos4 vs España1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais1Grupo, 2, '2024-09-07', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;

	--Estados Unidos2 vs Paraguay3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,7, IdPais3Grupo, 0, '2024-09-07', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	SELECT Id INTO IdPais1Grupo FROM pais WHERE pais='Alemania';
	IF IdPais1Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Alemania', '');
		IdPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Venezuela';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Venezuela', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Nigeria';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Nigeria', '');
		IdPais3Grupo:= nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Corea del sur';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Corea del sur', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +3;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+3;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+3, IdPais1Grupo),
			(nuevoIdGrupo+3, IdPais2Grupo),
			(nuevoIdGrupo+3, IdPais3Grupo),
			(nuevoIdGrupo+3, IdPais4Grupo);

	END IF;
	-- Alemania1 vs Venezuela2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,5, IdPais2Grupo, 2, '2024-09-01', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	-- Nigeria3 vs Corea del sur4
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,1, IdPais4Grupo, 0, '2024-09-01', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Alemania1 vs Nigeria3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,3, IdPais3Grupo, 1, '2024-09-04', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Corea del sur4 vs Venezuela2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais2Grupo, 0, '2024-09-04', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Corea del sur4 vs Alemania1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,1, IdPais1Grupo, 0, '2024-09-07', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Venezuela2 vs Nigeria3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,0, IdPais3Grupo, 4, '2024-09-07', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	
	SELECT Id INTO IdPais1Grupo FROM pais WHERE pais='Ghana';
	IF IdPais1Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Ghana', '');
		IdPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Austria';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Austria', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Japón';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Japón', '');
		IdPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Nueva Zelanda';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Nueva Zelanda', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +4;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+4;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+4, IdPais1Grupo),
			(nuevoIdGrupo+4, IdPais2Grupo),
			(nuevoIdGrupo+4, IdPais3Grupo),
			(nuevoIdGrupo+4, IdPais4Grupo);

	END IF;
	--Ghana1 vs Austria2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,1, IdPais2Grupo, 2, '2024-09-02', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Japon3 vs Nueva Zelanda4
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,7, IdPais4Grupo, 0, '2024-09-02', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Japon3 vs Ghana1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,4, IdPais1Grupo, 1, '2024-09-05', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Austria2 vs Nueva Zelanda4
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,3, IdPais4Grupo, 1, '2024-09-05', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Austria2 vs Japon3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,0, IdPais3Grupo, 2, '2024-09-08', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Nueva Zelanda4 vs Ghana1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,1, IdPais1Grupo, 3, '2024-09-08', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	

	SELECT Id INTO IdPais1Grupo FROM pais WHERE pais='Corea del Norte';
	IF IdPais1Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Corea del Norte', '');
		IdPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais2Grupo FROM pais WHERE pais='Argentina';
	IF IdPais2Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Argentina', '');
		IdPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais3Grupo FROM pais WHERE pais='Costa Rica';
	IF IdPais3Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Costa Rica', '');
		IdPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;

	SELECT Id INTO IdPais4Grupo FROM pais WHERE pais='Paises Bajos';
	IF IdPais4Grupo IS NULL THEN
		INSERT INTO pais
			(Id, pais, entIdad ) VALUES(nuevoIdPais, 'Paises Bajos', '');
		IdPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais +5;

	END IF;
	
	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE Idgrupo=nuevoIdGrupo+5;
	IF totalPaises=0 THEN
		INSERT INTO grupopais
			(Idgrupo, Idpais)
			VALUES
			(nuevoIdGrupo+5, IdPais1Grupo),
			(nuevoIdGrupo+5, IdPais2Grupo),
			(nuevoIdGrupo+5, IdPais3Grupo),
			(nuevoIdGrupo+5, IdPais4Grupo);

	END IF;
	--Corea del Norte1 vs Argentina2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,6, IdPais2Grupo, 2, '2024-09-02', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Costa Rica3 vs Paises Bajos4
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais3Grupo  AND IdPais2 = IdPais4Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais3Grupo,0, IdPais4Grupo, 2, '2024-09-02', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Corea del Norte1 vs Costa Rica3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais1Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais1Grupo,9, IdPais3Grupo, 0, '2024-09-05', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Paises Bajos4 vs Argentina2
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais2Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,3, IdPais2Grupo, 3, '2024-09-05', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Paises Bajos4 vs Corea del Norte1
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais4Grupo  AND IdPais2 = IdPais1Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais4Grupo,0, IdPais1Grupo, 2, '2024-09-08', IdEstadio2, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
	END IF;
	--Argentina2 vs Costa Rica3
	IF NOT EXISTS(SELECT * FROM encuentro
				WHERE IdPais1 = IdPais2Grupo  AND IdPais2 = IdPais3Grupo 
					AND IdFase =1 AND IdCampeonato = nuevoIdCampeonato) THEN
	INSERT INTO Encuentro
		(Id, IdPais1, goles1, IdPais2, goles2, fecha, IdEstadio, IdFase, IdCampeonato)
		VALUES(nuevoIdEncuentro, IdPais2Grupo,1, IdPais3Grupo, 0, '2024-09-08', IdEstadio4, 1, nuevoIdCampeonato );
		nuevoIdEncuentro := nuevoIdEncuentro+1;
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


SELECT *
	FROM vEncuentro
	WHERE Campeonato='FIFA U-20 Women`s World Cup Colombia 2024';

