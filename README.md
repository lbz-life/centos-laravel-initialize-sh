Description
------------
Simple bash script that inititalizes and sets correct permissions for a new project.

Instructions
------------
1. Create new laravel project:
```
git clone https://github.com/laravel/laravel.git
```
2. Install laravel files:
```
composer install
```

3. Run custom initialization script:
```
cd /var/www/your-project
bash ./initialize.sh
```
4. Update your db connections parameters in `.env`

5. Run `php artisan migrate` to migrate tables

Notes
------------
If you get the following error when migrating:
```
SQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes (SQL: alter table 'users' add unique 'users_email_unique'('email'))
```
You will need to update `app/Providers/AppServiceProvider.php` with the following:
```
use Illuminate\Support\Facades\Schema;

public function boot()
{
    Schema::defaultStringLength(191);
}
```

References
------------
* https://tecadmin.net/install-laravel-framework-on-centos/
* https://tecadmin.net/laravel-file-permissions/
