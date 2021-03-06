class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cat_requests

  def cat_me!
    req = cat_requests.create!
		CatRequestWorker.perform_sync req.id
    #req.fulfill
  end
end
