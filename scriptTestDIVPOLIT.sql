
		

	--Crear tabla Moneda
	CREATE TABLE IF NOT EXISTS tblMoneda( 
		Id SERIAL PRIMARY KEY,
		Moneda VARCHAR(50) NOT NULL,
		Sigla VARCHAR(3),
		Imagen BYTEA NULL
	);
	
	--Agregar columnas MAPA y BANDERA a la tabla Pais
	alter table pais 
		add column IF NOT EXISTS mapa BYTEA ,
		add column IF NOT EXISTS bandera BYTEA ,
		add column IF NOT EXISTS idmoneda INTEGER ;	
		
	DO $$
	BEGIN
		IF EXISTS (
			SELECT 1 
			FROM information_schema.columns 
			WHERE table_name = 'pais' 
			AND column_name = 'moneda'
		) THEN
			INSERT INTO tblMoneda (Moneda)
				SELECT DISTINCT Moneda
				FROM Pais
				WHERE NOT EXISTS (
					SELECT 1 
					FROM tblMoneda 
					WHERE tblMoneda.Moneda = Pais.Moneda
				);
		END IF;
	END $$;
	
		
	DO $$
	BEGIN
		IF EXISTS (
			SELECT 1 
			FROM information_schema.columns 
			WHERE table_name = 'pais' 
			AND column_name = 'moneda'
		) THEN
			UPDATE pais
			SET idmoneda = tblMoneda.id
			FROM tblMoneda
			WHERE pais.moneda = tblMoneda.moneda;
		END IF;
	END $$;
	
	
	DO $$
	BEGIN
		IF EXISTS (
			SELECT 1 
			FROM information_schema.columns 
			WHERE table_name = 'pais' 
			AND column_name = 'moneda'
		) THEN
			ALTER TABLE pais 
			DROP COLUMN Moneda;
		END IF;
	END $$;
		
	UPDATE tblMoneda SET Sigla = 'CRC' WHERE id = 1;
	UPDATE tblMoneda SET Sigla = 'AUD' WHERE id = 2;
	UPDATE tblMoneda SET Sigla = 'CAD' WHERE id = 3;
	UPDATE tblMoneda SET Sigla = 'PYG' WHERE id = 4;
	UPDATE tblMoneda SET Sigla = 'EUR' WHERE id = 5;
	UPDATE tblMoneda SET Sigla = 'CLP' WHERE id = 6;
	UPDATE tblMoneda SET Sigla = 'VEB' WHERE id = 7;
	UPDATE tblMoneda SET Sigla = 'BRL' WHERE id = 8;
	UPDATE tblMoneda SET Sigla = 'PEN' WHERE id = 9;
	UPDATE tblMoneda SET Sigla = 'BOB' WHERE id = 10;
	UPDATE tblMoneda SET Sigla = 'GBP' WHERE id = 11;
	UPDATE tblMoneda SET Sigla = 'DOP' WHERE id = 12;
	UPDATE tblMoneda SET Sigla = 'USD' WHERE id = 13;
	UPDATE tblMoneda SET Sigla = 'PAB' WHERE id = 14;
	UPDATE tblMoneda SET Sigla = 'ARS' WHERE id = 15;
	UPDATE tblMoneda SET Sigla = 'GTQ' WHERE id = 16;
	UPDATE tblMoneda SET Sigla = 'PES' WHERE id = 17;
	UPDATE tblMoneda SET Sigla = 'MXN' WHERE id = 18;
	UPDATE tblMoneda SET Sigla = 'UYU' WHERE id = 19;
	UPDATE tblMoneda SET Sigla = 'COP' WHERE id = 20;
	

    





