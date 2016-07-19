module ActiveRecord
  module GroupingEnum
    def grouping_enum(definitions)
      definitions.each do |name, values|
        name = name.to_sym
        klass = self
        values.each do |key, enums|
          _grouping_enum_methods_module.module_eval do
            klass.send(:detect_enum_conflict!, name, "#{key}?")
            define_method("#{key}?") { enums.map(&:to_s).include?(self[name]) }

            klass.send(:detect_enum_conflict!, name, key.to_s, true)
            klass.scope key.to_s, lambda {
              clause = enums.each_with_object Hash.new { |h, k| h[k] = [] } do |enum, obj|
                obj[name] << klass.public_send(name.to_s.pluralize.to_sym)[enum.to_s]
              end
              klass.where(clause)
            }
          end
        end
      end
    end

    private

    def _grouping_enum_methods_module
      @_grouping_enum_methods_module ||=
        begin
          mod = Module.new
          include mod
          mod
        end
    end
  end
end
