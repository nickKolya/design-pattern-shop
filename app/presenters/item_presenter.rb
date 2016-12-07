class ItemPresenter
  class << self
    def map_sub_categories
      ::SubCategory.eager_load(:category)
                   .order('categories.name').map { |c| category_format(c) }
    end

    private

    def category_format(sub_cat)
      ["#{sub_cat.category_name} #{sub_cat.name}", sub_cat.id]
    end
  end
end
