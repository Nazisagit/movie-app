class CreditingService
  class NoPersonaToCredit < StandardError; end
  class NoAccreditableToCredit < StandardError; end
  class AccreditationTypeDoesNotExist < StandardError; end
  class AccreditationAlreadyExists < StandardError; end

  def initialize(persona)
    @persona = persona
  end

  def accredit(accreditable, accreditation_type)
    raise NoPersonaToCredit.new if persona.nil?
    raise NoAccreditableToCredit.new if accreditable.nil?
    raise AccreditationTypeDoesNotExist.new if Accreditation.accreditation_types[accreditation_type.to_sym].nil?

    accreditation = persona.accreditations.find_or_initialize_by(accreditation_type: accreditation_type, accreditable: accreditable)
    begin
      accreditation.save! unless accreditation.persisted?
    rescue ActiveRecord::RecordInvalid
      if accreditation.errors.of_kind?(:accreditation_type, :taken)
        raise AccreditationAlreadyExists.new, "#{persona.name} for #{accreditation.accreditable.title}"
      end
    end
    accreditation
  end

  private

  attr_reader :persona
end