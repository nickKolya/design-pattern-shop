namespace :app do
  namespace :db do
    desc 'Import data to data base'
    task import_data: :environment do
      unless Category.exists? || SubCategory.exists?
        Rake::Task['db:import'].reenable
        Rake::Task['db:import'].invoke('db/seeds/sub_categories.csv', Category, SubCategory)
      end
    end
  end
end
