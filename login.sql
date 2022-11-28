create login kavindu
with password = 'kavindu123',
default_database = master,
default_language = us_english

alter server role dbcreator add member kavindu
alter server role securityadmin add member kavindu


create login janaka
with password = 'janaka123',
default_database = master,
default_language = us_english

create login namali
with password = 'namali123',
default_database = master,
default_language = us_english

alter server role dbcreator drop member kamal
alter server role securityadmin drop member kamal

create server role sysadministr
grant create any database,
alter any database,
alter any login to sysadministr

alter server role sysadministr add member jaye