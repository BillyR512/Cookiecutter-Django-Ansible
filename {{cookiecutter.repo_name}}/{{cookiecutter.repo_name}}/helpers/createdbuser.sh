sudo -u postgres psql --command "CREATE USER {{ cookiecutter.database_user }} WITH ENCRYPTED PASSWORD '{{ cookiecutter.database_password }}';"
