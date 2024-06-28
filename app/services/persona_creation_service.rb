class PersonaCreationService
  class PersonaNameNotUnique < StandardError; end

  def initialize(name)
    @name = name
  end

  def create
    persona = Persona.find_or_initialize_by(name: name)
    begin
      persona.save! unless persona.persisted?
    rescue ActiveRecord::RecordInvalid
      raise PersonaNameNotUnique.new if persona.errors.of_kind?(:name, :taken)
    end
    persona
  end

  private

  attr_reader :name
end
