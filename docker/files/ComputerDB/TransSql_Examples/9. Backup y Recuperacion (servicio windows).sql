use ComputerDB

---- Copia de seguridad en motor de bd como servicio en windows
BACKUP DATABASE ComputerDB						--Se selecciona la bd a copiar
TO DISK = 'C:\backups\ComputerDB.Bak'				--seleccionamos a la carperta en donde se guardara junto con el nombre de la base de datos y la extencion .bak
   WITH FORMAT,								-- FORMAT (elimina las copias de seguridad existente y crea una nueva (con el mismo nombre) ).
      MEDIANAME = 'ComputerDB',
      NAME = 'ComputerDB';
GO


------------------------------------------------------------

----- Cerrar las conexions antes de restaurar la base de datos
DECLARE @processid INT 
SELECT  @processid = MIN(spid)
FROM    master.dbo.sysprocesses
WHERE   dbid = DB_ID(@dbname) 
WHILE @processid IS NOT NULL 
    BEGIN 
        EXEC ('KILL ' + @processid) 
        SELECT  @processid = MIN(spid)
        FROM    master.dbo.sysprocesses
        WHERE   dbid = DB_ID('ComputerDB_2') 
    END


------------- 2 REstarurar una Base de Datos 
-- Que permite cambiar la ubicacion de almacenamiento, nombre de la base de datos
-- nombre del archivo mdf y nombre del archivo log
use master;

RESTORE DATABASE ComputerDB_2												-- Se elige la base de datos a restaurar
 FROM ComputerDB											-- la direccion donde se guardan los backups
 WITH RECOVERY,
 MOVE 'ComputerDB' TO 'C:\backups\ComputerDB.mdf',
 MOVE 'ComputerDB_log' TO 'C:\backups\ComputerDB_log.ldf';
GO

RESTORE DATABASE ComputerDB_2												-- Se elige la base de datos a restaurar
 FROM DISK = 'C:\backups\ComputerDB.bak'											-- la direccion donde se guardan los backups
 WITH RECOVERY,
 MOVE 'ComputerDB' TO 'C:\backups\ComputerDB.mdf',
 MOVE 'ComputerDB_log' TO 'C:\backups\ComputerDB_log.ldf';
GO

---------------------------------------------------------------
