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

# Notes
If you get the following error:

``` SQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes (SQL: alter table 'users' add unique 'users_email_unique'('email'))```

You will need to update `AppServiceProvider.php` with the following

```
use Illuminate\Support\Facades\Schema;

public function boot()
{
    Schema::defaultStringLength(191);
}
```
