class StaticText < ActiveRecord::Base
  attr_accessible :key, :value

  def self.get_value(key)
    if (st = StaticText.find_by(key: key))
      st.value
    end
  end
end
