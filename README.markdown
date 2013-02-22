[![Code Climate](https://codeclimate.com/github/insignia4u/i4u.png)](https://codeclimate.com/github/insignia4u/i4u)

# Insignia Site i4u  

## Migraciones

En la migración 20121210132515_add_title_to_person[http://github.com/insignia4u/i4u/blob/master/db/migrate/20121210132515_add_title_to_person.rb], se agrega el campo title_name al modelo Person[https://github.com/insignia4u/i4u/blob/master/app/models/person.rb], y luego se migra Title.name al campo recien agregado.

**IMPORTANTE: AL HACER ESTE MIGRATE, EL ROLLBACK PERDERÁ LOS DATOS DE TITLE**
