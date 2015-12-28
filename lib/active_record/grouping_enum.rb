module ActiveRecord
  module GroupingEnum
    def grouping_enum(definitions)
      definitions.each do |name, values|
        name = name.to_sym
        klass = self
        values.each do |key, enums|
          _grouping_enum_methods_module.module_eval do
            klass.send(:detect_enum_conflict!, name, "#{key}?")
            define_method("#{key}?") do
              values = []
              enums.each do |enum|
                values << klass.defined_enums[name.to_s].fetch(enum.to_s)
              end
              values.include?(self[name])
            end

            klass.send(:detect_enum_conflict!, name, "#{key}", true)
            klass.scope "#{key}", lambda {
              query = "#{name} == #{klass.defined_enums[name.to_s][enums.shift.to_s]}"
              enums.each do |enum|
                query << " or #{name} == #{klass.defined_enums[name.to_s][enum.to_s]}"
              end
              klass.where(query)
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
