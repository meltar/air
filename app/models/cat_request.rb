class CatRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat

  def fulfill
		return if cat.present?
    sleep 5 # Pretend this is harder than it really is
    update_attributes cat: Cat.choose
    `open #{cat.download_path} -a 'Google Chrome'`
  end
end
