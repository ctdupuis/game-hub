require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use RegistrationsController
use UsersController
use GamesController
use StudiosController

run ApplicationController
