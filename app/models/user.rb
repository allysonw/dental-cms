class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true

  # TO DO // enable support for Identities for users to enable authentication
  # with multiple providers for the same user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      binding.pry
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      binding.pry
    end
  end
end

# Omniauth hashes
#--------- GOOGLE ---------- https://github.com/zquestz/omniauth-google-oauth2
# "provider" => "google_oauth2",
#   "uid" => "100000000000000000000",
#   "info" => {
#     "name" => "John Smith",
#     "email" => "john@example.com",
#     "first_name" => "John",
#     "last_name" => "Smith",
#     "image" => "https://lh4.googleusercontent.com/photo.jpg",
#     "urls" => {
#       "google" => "https://plus.google.com/+JohnSmith"
#
#--------- FACEBOOK ---------
# provider: 'facebook',
#   uid: '1234567',
#   info: {
#     email: 'joe@bloggs.com',
#     name: 'Joe Bloggs',
#     first_name: 'Joe',
#     last_name: 'Bloggs',
#     image: 'http://graph.facebook.com/1234567/picture?type=square',
#     verified: true
