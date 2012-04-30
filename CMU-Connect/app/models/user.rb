class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :role, :password, :password_confirmation, :andrew, :first_name, :last_name, :phone, :carrier, :receive_text
  has_many :user_confs
  has_many :conferences, :through => :user_confs 
  has_many :survey_users, :dependent => :destroy
  has_many :surveys, :through => :survey_users
  ROLES = %w[admin default banned]
  CARRIERS = %w[AT&T Verizon T-Mobile Virgin Sprint]  
  
  def role?
    return self.role    
  end
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end  

  def get_carrier_email
    if self.carrier == "AT&T"
      return "txt.att.net"
    elsif self.carrier == "Verizon"
      return "vtext.com" 
    elsif self.carrier == "T-Mobile"
      return "tmomail.net"
    elsif self.carrier == "Sprint"
     return "messaging.sprintpcs.com"
    elsif self.carrier == "Virgin"
     return "vmobl.com"
    end
  end

  attr_accessor :password
  before_save :prepare_password
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_format_of :phone, :with => /^[\d]{10}$/, :message => "should contain 10 numbers", :allow_blank => true

  def invitations
    ucs = UserConf.where("user_id = ? AND confirmed = ?",self.id,false).all
    return ucs
  end

  def self.random_password
    rand(36**16).to_s(36)
  end

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private
  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
