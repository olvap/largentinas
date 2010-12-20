require 'rails/generators/resource_helpers'
require 'rails/generators/rails/model/model_generator'
require 'active_support/core_ext/object/blank'

class LargentinasGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
   
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1 )
    end
  end
      
  def install
    gem "will_paginate", "~> 3.0.pre2"  
    puts "paginacion"
    gem "cancan"
    puts "permisos para roles"
    gem "meta_search"
    puts "hace las busquedas mas faciles"
    gem "builder"
    puts "para hacer los xml"
    
    generate('bundle install')
    #generate('nifty:layout')
    #generate('devise:views')

    #models

    #vistas    
    migrations
    
  end
  
  private

  def migrations
    #migraciones    
    cf_mig("create_localidads")
    cf_mig("create_departamentos")
    cf_mig("create_provincias")
    cf_mig("localidad_data")
    cf_mig("departamento_data")
    cf_mig("provincia_data")
      
  end
  
  def cf_mig(dir)  
    migration_template "db/migrate/#{dir}.rb", "db/migrate/#{dir}"
    sleep 1
  end
  
  def cf_js(dir)
    copy_file("public/javascripts/#{dir}","public/javascripts/#{dir}")
  end
  
  def cf_h(dir)
    copy_file("app/helpers/#{dir}","app/helpers/#{dir}")
  end
   
  def cf_v(dir)
    copy_file("app/views/#{dir}","app/views/#{dir}")
  end
  
  def cf_m(dir)
    copy_file("app/models/#{dir}","app/models/#{dir}")
  end
  
  def cf_c(dir)
    copy_file("app/controllers/#{dir}","app/controllers/#{dir}")
  end
  
end