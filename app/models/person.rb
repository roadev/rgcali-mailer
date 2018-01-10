class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :role, type: String, default: 'attendant'
  field :email, type: String
  field :gender, type: String
  field :register_date, type: String
  field :birth_date, type: String
  field :phone, type: String
  field :level, type: String
  field :motivation, type: String
  field :expectation, type: String
  field :heard_ror, type: String
  field :laptop, type: String
  field :so, type: String
  field :attended, type: String
  field :how_did_you_find_it, type: String
  field :days, type: String
  field :tshirt_size, type: String
  field :expectation2, type: String
  field :languages, type: String
  field :data_treatment, type: String
  field :profession, type: String
  field :attended_friday, type: Boolean
  field :attended_saturday, type: Boolean
  field :accepted, type: Boolean

  def self.order(type)
    super(type.asc)
  end

  validates_presence_of :name, :role, :email
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  scope :by_role, lambda { |role| where(role: role) }
  scope :by_gender, lambda { |gender| where(gender: gender) }
  scope :by_laptop, lambda { |laptop| where(laptop: laptop) }
  scope :by_days, lambda { |days| where(days: days) }
  scope :by_level, lambda { |level| where(level: level) }
  scope :by_tshirt, lambda { |tshirt| where(tshirt_size: tshirt) }
  scope :by_email, lambda { |email| where(email: email) }
  scope :by_accepted, lambda { |accepted| where(accepted: accepted) }

  def first_name
    name.present? ? name.split(' ')[0].capitalize : ''
  end

end
