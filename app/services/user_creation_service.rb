class UserCreationService
  class NoNameProvided < StandardError; end

  def initialize(name)
    @name = name
  end

  def create
    raise NoNameProvided.new if name.nil?
    user = User.find_or_initialize_by(name: name)
    user.save unless user.persisted?
    user
  end

  private

  attr_reader :name
end
