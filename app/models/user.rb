class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body
has_many :saved_jobs, :dependent => :destroy
has_many :saved_companies, :dependent => :destroy
has_many  :hidden_jobs, :dependent => :destroy
end
