class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :events, through: :participations
  has_one :location
  # has_many :own_events, -> {where()}

  def own_events
    Event.where(creator_id: self.id)
  end

  # Pagination
  paginates_per 100

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  validates_presence_of :address

  after_create :create_location

  def self.paged(page_number)
    order(admin: :desc, email: :asc).page page_number
  end

  def self.search_and_order(search, page_number)
    if search
      where("email LIKE ?", "%#{search.downcase}%").order(
          admin: :desc, email: :asc
      ).page page_number
    else
      order(admin: :desc, email: :asc).page page_number
    end
  end

  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id", "email", "created_at")
  end

  def self.last_signins(count)
    order(last_sign_in_at:
              :desc).limit(count).select("id", "email", "last_sign_in_at")
  end

  def self.users_count
    where("admin = ? AND locked = ?", false, false).count
  end

  private

  def create_location
    street, city, country = self.address.split(', ')
    location.find_or_create_by(street: street, city: city, country: country)
  end
end
