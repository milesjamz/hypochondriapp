class Investigator < ApplicationRecord
  has_many :studies
  has_many :conditions, through: :studies

  def self.random_investigator
    Investigator.all.shuffle[0].NAME_DEGREE
  end

  def find_studies
    Study.where(NCT_ID: self.NCT_ID)
  end
  
  def count_studies
    find_studies.count
  end

  def find_studies_by_name
    investigators = Investigator.where(NAME_DEGREE: self.NAME_DEGREE)
    arr = []
    investigators.each {|investigator| arr.concat(investigator.find_studies)}
    arr 
  end

  def count_studies_by_name
    find_studies_by_name.count
  end

  def find_drugs
    Intervention.where(NCT_ID: self.NCT_ID)
  end

  def count_found_drugs
    find_drugs.count
  end

  def find_companies
    arr = Sponsor.where(NCT_ID: self.NCT_ID)
    arr.map {|sponsor| sponsor.AGENCY}
  end

  def count_found_companies
    find_companies.count
  end

  def count_completed_studies
    find_studies.where("COMPLETION_DATE IS NOT NULL").count
  end 

  def rated_by_mcw
    index = count_studies + count_completed_studies
  end


end