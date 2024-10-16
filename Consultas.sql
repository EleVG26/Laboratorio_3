select * from pais

select * from encuentro -- consulta estadio campeonato

select * from ciudad where idpais=1

select * from estadio

update estadio --actualizar estadio
	set IdCiudad=3
	where Id=56

SELECT 
  column_name, 
  data_type, 
  character_maximum_length, 
  is_nullable, 
  column_default 
FROM 
  information_schema.columns 
WHERE 
  table_name = 'encuentro';

CREATE VIEW vEncuentro
AS
	SELECT E.Fecha, E.IdPais1, P1.Pais Pais1, E.Goles1, E.IdPais2, P2.Pais Pais2, E.Goles2,
        C.Campeonato, E.IdCampeonato, E.IdFase, F.Fase, ES.Estadio, E.IdEStadio
		FROM Encuentro E
			JOIN Pais P1 ON E.IdPais1=P1.Id
			JOIN Pais P2 ON E.IdPais2=P2.Id
			JOIN Campeonato C ON E.IdCampeonato=C.Id
            JOIN Estadio ES ON E.IdEstadio=ES.Id
            JOIN Fase F ON E.IdFase=F.Id;
SELECT *
		FROM estadio e
			JOIN ciudad c ON e.idCiudad=c.id
		WHERE idpais=1

SELECT *
	FROM vencuentro
	WHERE campeonato = 'FIFA U-20 Women`s World Cup Colombia 2024';

SELECT * FROM fObtenerTablaPosiciones(20);