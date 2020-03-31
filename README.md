# Description
Simple bash script that sets correct permissions for a new project.

Running
------------

1. 
```
cd /var/www/your-project
bash ./initialize.sh
```
2. Update your db connections parameters in `.env`

3. Run `php artisan migrate` to migrate tables
