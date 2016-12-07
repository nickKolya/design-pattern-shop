# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( devise.* )
Rails.application.config.assets.precompile += %w( orders/index.js orders/new.js orders/create.js orders/update.js orders/edit.js orders/show.js orders/index.css )
Rails.application.config.assets.precompile += %w( items.css )
Rails.application.config.assets.precompile += %w( items.js )
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( products.js )
Rails.application.config.assets.precompile += %w( services.js )
Rails.application.config.assets.precompile += %w( services.css )
