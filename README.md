# Reseñas PUC

## Instalación Local

El primer paso es clonar el repositorio con:
```bash
    $ git clone git@github.com:puc-reviews/puc-reviews-rails.git
``` 
En algun directorio. Si todavía no conocer GIT o sus herramientas, dirijase a [Git]( https://git-scm.com/).

Este proyecto, asume que tiene actualmente instalados [Ruby](https://www.ruby-lang.org/es/), [Node.js](https://nodejs.org/es/), [PostgreSQL](https://www.postgresql.org/), y [make](https://www.gnu.org/software/make/)/[cmake](https://cmake.org/), de los cuales muchos sistemas operativos ya tienen implementados.



El siguiente paso, es correr el comando:
```bash
    $ ./bin/setup
```

En el directorio clonado

Este comando/script, se asegurara de que se obtenga lo siguiente:

- Instalación de dependencias
- Preparación de la base de datos
- Agregar los comandos necesarios de Heroku

Cuando el comando anterior se corra sin error alguno, entonces estará listo para correr la aplicación por primera vez. Esto puede ser hecho corriendo
```bash
    $ rails server
```
o
```bash
    $ rails s
```


## Guía de estilo

Este proyecto y el estilo de su codigo(de Ruby) se rigen bajo el linter de `rubocop` o `rubocop-rspec`, por lo que todo codigo subido en forma de Pull Request deberá pasar por este estandar.

Puede aprender más sobre esta gema en [Rubocop](https://github.com/rubocop-hq/rubocop).


Adicionalmente, puede(y debería) integrar este linter en su editor de preferencia a través de las extensiones


## Internal dependencies

### Authorization

For defining which parts of the system each user has access to, we have chosen to include the [Pundit](https://github.com/elabs/pundit) gem, by [Elabs](http://elabs.se/).

### Authentication

We are using the great [Devise](https://github.com/plataformatec/devise) library by [PlataformaTec](http://plataformatec.com.br/)

### File Storage

For managing uploads, this project uses [Active Storage](https://github.com/rails/rails/tree/master/activestorage).

### Rails pattern enforcing types

This projects uses [Power-Types](https://github.com/platanus/power-types) to generate Services, Commands, Utils and Values.

### Presentation Layer

This project uses [Draper](https://github.com/drapergem/draper) to add an object-oriented layer of presentation logic

### Queue System

For managing tasks in the background, this project uses [Sidekiq](https://github.com/mperham/sidekiq)

## Seeds

To populate your database with initial data you can add, inside the `/db/seeds.rb` file, the code to generate **only the necessary data** to run the application.
If you need to generate data with **development purposes**, you can customize the `lib/fake_data_loader.rb` module and then to run the `rake load_fake_data` task from your terminal.


## Development

For hot-reloading and fast webpacker compilation you need to run webpack's dev server along with the rails server:

    $ ./bin/webpack-dev-server

Running the dev server will also solve problems with the cache not refreshing between changes and provide better error messages if something fails to compile.

For even faster in-place component refreshing (with no page reloads), you can enable Hot Module Reloading in `config/webpacker.yml`

    development:
      dev_server:
        hmr: true

