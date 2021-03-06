rabbitmqctl change_password guest newpassword   # Поменять пароль пользователя
 
rabbitmqctl delete_user guest # Удаляем пользователя guest

rabbitmqctl add_user rabbit password # Добавление нового пользователя

rabbitmqctl clear_password guest # Сбросим пароль пользователю guest

rabbitmqctl authenticate_user user paswduser # Эта команда инструктирует брокера RabbitMQ аутентифицировать пользователя с именем user с помощью проверки пароля.

rabbitmqctl list_users # Просмотреть всех пользователей

#########
#Разрешения для пользователя
rabbitmqctl set_permissions [-p vhost] {user} {conf} {write} {read}
# Где:
# vhost - Имя виртуального хоста, которому предоставляется пользовательский доступ, по умолчанию - /.
# user - Имя пользователя для предоставления доступа к указанному виртуальному хосту.
# conf - Регулярное выражение, соответствующее именам ресурсов, для которых пользователю предоставляются разрешения на настройку.
# write - Регулярное выражение, соответствующее именам ресурсов, для которых пользователю предоставляются права на запись.
# read - Регулярное выражение, соответствующее именам ресурсов, для которых пользователю предоставляются разрешения на чтение.

# Например, для пользователя user всем хостам дать все разрешения

rabbitmqctl set_permissions -p / user "/*" ".*" ".*
"# или
rabbitmqctl set_permissions -p /myvhost tonyg "^tonyg-.*" ".*" ".*"
# Эта команда инструктирует брокера RabbitMQ предоставить пользователю с именем tonyg доступ к виртуальному хосту с именем /myvhost, с разрешениями конфигурации для всех ресурсов, чьи имена начинаются с «tonyg-», а также разрешения на запись и чтение для всех ресурсов.


rabbitmqctl clear_permissions [-p vhost] {username} # Удалить разрешения для пользователя
vhost - Он имя виртуального хоста, которому запрещается доступ пользователя, по умолчанию - /.
username - Имя пользователя для отказа в доступе к указанному виртуальному хосту.

rabbitmqctl clear_permissions -p /myvhost tonyg # инструктирует брокера RabbitMQ запретить пользователю с именем tonyg доступ к виртуальному хосту с именем /myvhost.
 

list_permissions [-p vhost] # Просмотр разрешений для хоста
vhost - Имя виртуального хоста, для которого можно указать пользователей, которым был предоставлен доступ к нему, и их разрешения. По умолчанию /.

rabbitmqctl list_user_permissions {username} # Просмотр разрешений для пользователя.

####
#Сброс всех очередей в rabbitmq
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

####
rabbitmqctl cluster_status # Состояние кластера

rabbitmqctl forget_cluster_node rabbit@dc1-trmq-node3 # Удалить из кластера
