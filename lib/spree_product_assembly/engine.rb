module SpreeProductAssembly
  class Engine < Rails::Engine
    engine_name 'spree_product_assembly'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.env.development? ? load(c) : require(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
