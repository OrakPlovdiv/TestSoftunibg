create table MenuSkladN (
  "n" integer,
  "MenuN" integer
)

GO

ALTER TABLE MenuSkladN
ADD FOREIGN KEY "MenuName" ("MenuN")
REFERENCES "MenuName" ("N")

GO

