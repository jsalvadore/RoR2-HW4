class Profile < ActiveRecord::Base
  belongs_to :user

  validate :both_names_not_nil
  validate :proper_gender
  validate :not_sue

  def both_names_not_nil
  	if first_name.nil? && last_name.nil?
  		errors.add(:last_name,"Both first and last name can't be nil!")
  	end
  end

  def proper_gender
  	if gender != "male" && gender != "female"
  		errors.add(:gender,"This program doesn't believe in non-binaries!")
  	end
  end

  def not_sue
  	if gender == "male" && first_name == "Sue"
  		errors.add(:first_name, "This program doesn't like boys named Sue!")
  	end
  end

  def self.get_all_profiles(min_year, max_year)
  	profiles = self.where("birth_year BETWEEN :min_year AND :max_year",min_year: min_year,max_year: max_year).order(:birth_year)
  	return profiles
  end

end
