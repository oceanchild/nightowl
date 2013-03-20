require 'digest'
# require 'paperclip_processors'
class User < ActiveRecord::Base
  has_one :profile
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :events
  has_and_belongs_to_many :tags
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  # has_attached_file :image, :styles => { :small => "100x100#", :large => "500x500>"}, 
                  # :url  => "/assets/users/:id/:style/:basename.:extension",
                  # :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension", :processors => [:cropper]
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  # after_update :reprocess_image, :if => :cropping?
#                 
  # validates_attachment_size :image, :less_than => 5.megabytes
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  attr_accessor :password
  validates :nickname, :presence => true, :uniqueness => true,
                       :length => {:within => 4..30},
                       :format => {:with => /^[\w\u0800-\u9fa5]*$/ }
  validates :email, :uniqueness => true,
                    :length => {:within => 5..50},
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :password, :confirmation => true,
               :length => { :within => 8..20 },
               :presence => true,
               :if => :password_required?
  before_save :encrypt_new_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(email, password)
  end
  
  def authenticated?(email, password)
    # self.hashed_password == password + self.created_at.to_s.split(" ")[0].split("-")[1] + self.email
    (self.hashed_password == encrypt(password + email)) && (self.blocked == false)
  end
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
   
    
    puts "x:" + crop_x.inspect
    puts "y:" + crop_y.inspect
    puts "w:" + crop_w.inspect
    puts "h:" + crop_h.inspect
    
    puts "**********************"
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  private
    def reprocess_image
      image.reprocess!
    end

  
  protected
    def encrypt_new_password
      return if password.blank?
      # self.hashed_password = password + Time.now.to_s.split(" ")[0].split("-")[1] + email
      self.hashed_password = encrypt(password + email)
    end
    
    def password_required?
      hashed_password.blank? || password.present?
    end
    
    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
