CREATE DATABASE if not exists inventory;

# For debugging purposes
# SHOW GRANTS FOR CURRENT_USER;
# SELECT user, host FROM mysql.user WHERE user = 'user';

-- Be careful, while opening the host to the DB client(s)
CREATE USER if not exists 'user'@'%' IDENTIFIED BY 'password';
CREATE USER if not exists 'user'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT ON *.* TO 'user'@'%';
GRANT SELECT ON *.* TO 'user'@'localhost';
GRANT REPLICATION SLAVE ON *.* TO 'user'@'%';
GRANT REPLICATION SLAVE ON *.* TO 'user'@'localhost';
GRANT REPLICATION CLIENT ON *.* TO 'user'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'user'@'localhost';

GRANT RELOAD ON *.* TO 'user'@'%';
GRANT RELOAD ON *.* TO 'user'@'localhost';
GRANT LOCK TABLES ON *.* TO 'user'@'%';
GRANT LOCK TABLES ON *.* TO 'user'@'localhost';

GRANT SHOW VIEW ON inventory.* TO 'user'@'%';
GRANT SHOW VIEW ON inventory.* TO 'user'@'localhost';

GRANT SHOW DATABASES ON *.* TO 'user'@'%';
GRANT SHOW DATABASES ON *.* TO 'user'@'localhost';

-- For the POC, we shall use the same user to perform CRUD operations. So,
GRANT SELECT, INSERT, UPDATE, DELETE ON inventory.* TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON inventory.* TO 'user'@'localhost';

-- Again, for the POC, let's also give this user some DBA-like privileges. So,
GRANT CREATE, ALTER, DROP ON inventory.* TO 'user'@'%';
GRANT CREATE, ALTER, DROP ON inventory.* TO 'user'@'localhost';

-- What's the point, if you forget to flush it.. ;-)
FLUSH PRIVILEGES;

use inventory;

create table if not exists device
(
    id         int auto_increment primary key,
    name       varchar(50)             not null,
    created_at timestamp default now() not null
);

insert into device(name) value('Phone');
