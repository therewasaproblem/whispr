# Configurando o banco PostgreSQL

Primeiro, instale o banco de dados com o comando:

```sh
$ sudo apt-get install postgresql postgresql-contrib
```

Em seguida, será necessário alterar o arquivo `/etc/postgresql/10/main/pg_hba.conf`. 
Altere o final deste arquivo para que _todas as ultimas colunas_ se tornem **md5**. 
Como um exemplo:

```
# DO NOT DISABLE!
# If you change this first entry you will need to make sure that the
# database superuser can access the database using some other method.
# Noninteractive access to all databases is required during automatic
# maintenance (custom daily cronjobs, replication, and similar tasks).
#
# Database administrative login by Unix domain socket
local   all             postgres                                md5

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```

Após alterar o arquivo, reinicie o servico, com:
```sh
$ sudo service postgresql restart
```

Será também necessário alterar a senha do usuário _postgres_ do banco de dados:
```
$ sudo -u postgres psql

postgres=# \password
(Digite e confirme a senha aqui, por padrão é postgres, pode ser alterada no arquivo config/database.yml)
postgres=# \q
```

Crie os bancos de dados com: `$ rake db:create`, e, por fim, teste o servidor com `$ rails server`.
