require "#{Rails.root}/lib/db_import"

namespace :db do
  desc 'Imports a CSV file into an ActiveRecord table'
  task :import, [:file_path, :model, :sub_model] => :environment do |_, args|
    import = Import.new(args)

    puts import.start_msg

    import.read_csv do |row|
      model_params = row.to_hash.slice(*import.model.attribute_names)
      model_object = import.model.find_or_create_by(model_params)

      puts "#{import.model.name} wasn't found or created: #{model_params}" unless model_object

      if import.sub_model && model_object
        sub_model_params = JSON.parse(row[import.sub_model.name.underscore])
        sub_model_object = model_object
                           .method(import.valid_name(:sub_model)).call
                           .build(sub_model_params)

        puts "#{import.sub_model.name} wasn't saved: #{sub_model_params}" unless sub_model_object.save
      end
    end

    puts import.finish_msg
  end
end
