--
-- Test foreign-data wrapper file_fdw_program.
--

-- Install file_fdw_program
CREATE EXTENSION file_fdw_program;

CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw_program;

CREATE FOREIGN TABLE onetwothree(one text, two text, three text)
SERVER file_server
OPTIONS ( program 'echo one,two,three', format 'csv' );

SELECT * FROM onetwothree;

CREATE FOREIGN TABLE fourfivesix(four integer, five numeric(6,2), six date)
SERVER file_server
OPTIONS ( program 'echo 4,5.5,2066-06-06', format 'csv' );

SELECT * FROM fourfivesix;

DROP FOREIGN TABLE onetwothree;
DROP FOREIGN TABLE fourfivesix;


