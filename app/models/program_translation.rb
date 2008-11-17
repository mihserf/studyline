class ProgramTranslation < ActiveRecord::Base
  belongs_to :localedb
  belongs_to :program
end
