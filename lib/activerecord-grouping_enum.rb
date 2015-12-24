require 'active_record'

ActiveSupport.on_load(:active_record) do
  require 'active_record/grouping_enum'
  ActiveRecord::Base.send(:extend, ActiveRecord::GroupingEnum)
end
