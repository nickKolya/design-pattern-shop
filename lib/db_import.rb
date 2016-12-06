require 'csv'

class Import
  attr_reader :file_path, :model, :sub_model

  def initialize(args)
    @file_path = args[:file_path]
    @model = define_class_of(args[:model])
    @sub_model = define_class_of(args[:sub_model])
  end

  def read_csv
    CSV.foreach(csv_file_path, col_sep: ';', headers: true) do |row|
      yield row
    end
  end

  def start_msg
    msg = "Start importing #{valid_name(:model)}...\n"
    msg << " - with #{valid_name(:sub_model)}..." if sub_model
    msg
  end

  def finish_msg
    "Finish importing #{valid_name(:model)}."
  end

  def valid_name(arg)
    method(arg).call.name.underscore.pluralize
  end

  private

  def csv_file_path
    Rails.root.join(file_path)
  end

  def define_class_of(arg)
    arg.is_a?(String) ? arg.constantize : arg
  end
end
