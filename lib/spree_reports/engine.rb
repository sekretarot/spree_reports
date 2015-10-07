require 'spree/core'

module SpreeReports
  class Engine < ::Rails::Engine
    isolate_namespace Spree
    engine_name "spree_reports"
    
    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
    
    config.to_prepare do
      # load ruby files
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*.rb')) do |c|
        require_dependency(c)
      end
      
      # add css files to asset pipeline
      Rails.application.config.assets.precompile += %w( spree_reports/spree_reports.css )
    end
    
  end
end
