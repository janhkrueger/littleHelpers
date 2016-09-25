Package "yaml" installieren.

---

In einer R-Shell aufrufen:
install.packages("yaml", dependencies=TRUE)

---
Config-Yaml
db:
 host : foo.example.com
 name : Foo Base
 user : user453
 pass : zoom

---

Im Skript dann:
library(yaml)
config = yaml.load_file("config.yml")
dbConnect(PgSQL(), host=config$db$host, dbname=config$db$name, user=config$db$user, password=config$db$pass)
