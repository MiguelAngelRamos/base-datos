-- Crear usuario

```sql
CREATE USER 'userecommerce'@'localhost' IDENTIFIED BY 'academy';
```

-- Crear le otorgamos todos los permisos sobre de base de datos ecommerce_db
```sql
GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'userecommerce'@'localhost';
```