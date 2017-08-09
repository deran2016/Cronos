class UserData
  attr_accessor :user_id
  attr_accessor :id
  attr_accessor :team
  attr_accessor :level
  attr_accessor :money
  attr_accessor :hp
  attr_accessor :exp
  attr_accessor :max_exp

  def initialize
    @user_id = nil
    @id = ""
    @team = 0
    @level = 0
    @exp = 0
    @money = 0
    @hp = 0
    @exp = 0
    @max_exp = 0
  end
end
