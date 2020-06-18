USE [db-zoo]
GO
/****** Object: StoredProcedures [dbo].[getANIMAL_INFO] Script Date: 3/22/2017 7:50:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getANIMAL_INFO]

@animalName varchar(50)
AS
BEGIN
	DECLARE @errorString varchar(100)
	DECLARE @results AS varchar(5)

	SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

	BEGIN TRY
		SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
			IF @results = 0
				BEGIN
					RAISERROR(@errorString, 16, 1)
					RETURN
				END
			ELSE IF @results = 1
				BEGIN
				SELECT
				a1.species_name, a2.animalia_type,
				a3.class_type, a4.order_type,
				a5.habitat_type, a6.nutrition_type, a7.care_type
				FROM tbl_species a1
				INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
				INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
				INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
				INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
				INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
				INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
				WHERE a1.species_name = @animalName

			END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

	/* CONVERT(VARCHART(50), @totalHab) = This is converting the data from MONEY to VARCAR
	* CHAR(13) = Line Break
	* CHAR(9) = Tab Key */

	DECLARE @totalHab MONEY;
	DECLARE @totalNut MONEY;
	DECLARE @results MONEY;

	SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
	SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
	SET @results = (@totalHab + @totalNut);

	PRINT (
		CONVERT(VARCHAR(50), @totalHab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) +
		CONVERT(VARCHAR(50), @totalNut) + CHAR(9) + CHAR(9) + ' - The Total Nutrition Cost' + CHAR(13) + '----------' +CHAR(13) +
		CONVERT(VARCHAR(50), @results)
);
