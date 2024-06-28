# == Schema Information
#
# Table name: accreditations
#
#  id                 :integer          not null, primary key
#  accreditable_type  :string           not null
#  accreditation_type :integer          default("actor"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accreditable_id    :integer          not null
#  persona_id         :integer          not null
#
# Indexes
#
#  idx_on_accreditable_id_accreditable_type_accreditat_b68f458c1b  (accreditable_id,accreditable_type,accreditation_type,persona_id) UNIQUE
#  index_accreditations_on_accreditable                            (accreditable_type,accreditable_id)
#  index_accreditations_on_persona_id                              (persona_id)
#
# Foreign Keys
#
#  persona_id  (persona_id => personas.id)
#
class Accreditation < ApplicationRecord
  validates :accreditation_type, :persona, :accreditable, presence: true
  validates :accreditation_type, :accreditable_id, :accreditable_type, uniqueness: { scope: :persona_id }
  belongs_to :persona
  belongs_to :accreditable, polymorphic: true
  enum accreditation_type: %i[actor director]
end
