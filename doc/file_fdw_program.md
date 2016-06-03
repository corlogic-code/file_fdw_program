# file_fdw_program

This is a backport of a patch (due to land in Postgres 10.0) allowing file_fdw to accept a `program` option in place of a `filename` option. 

## Impelementation

This argument is passed to the `COPY` command in the exact same way as the `FROM PROGRAM` is passed, so there is very little coding to enable the option.

## Examples

```sql
CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw_program;
CREATE FOREIGN TABLE onetwothree(one text, two text, three text)
SERVER file_server
OPTIONS ( program 'echo one,two,three', format 'csv' );
SELECT * FROM onetwothree;
 one | two | three 
-----+-----+-------
 one | two | three
(1 row)

CREATE FOREIGN TABLE fourfivesix(four integer, five numeric(6,2), six date)
SERVER file_server
OPTIONS ( program 'echo 4,5.5,2066-06-06', format 'csv' );
SELECT * FROM fourfivesix;
 four | five |    six     
------+------+------------
    4 | 5.50 | 06-06-2066
(1 row)
```

### Authors

Corey Huinker, while working at [Moat](http://moat.com) - packaging, backporting
Adam Gomaa ( akgomaa@gmail.com ) - original (unsubmitted) PostgreSQL patch

### Copyright and License

Copyright (c) 2016, Moat Inc.

Permission to use, copy, modify, and distribute this software and its documentation for any purpose, without fee, and without a written agreement is hereby granted, provided that the above copyright notice and this paragraph and the following two paragraphs appear in all copies.

IN NO EVENT SHALL MOAT INC. BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF Moat, Inc. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

MOAT INC. SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND Moat, Inc. HAS NO OBLIGATIONS TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
