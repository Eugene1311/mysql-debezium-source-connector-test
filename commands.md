Create connector:
```bash
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" http://localhost:8083/connectors/ -d @connector/mysql-connector.json
```

Update connector properties:
```bash
curl -i -X PUT -H "Content-Type:application/json" http://localhost:8083/connectors/inventory-connector/config -d @connector/mysql-connector-update.json
```

Read binlog file:
```bash
mysqlbinlog --read-from-remote-server --host=127.0.0.1 --port=3306 \
            --user=root -p --stop-never binlog.000001
```
