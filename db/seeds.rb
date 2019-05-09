require_relative "../config/environment.rb"
# Investigator.delete_all
# binding.pry
# Illness.delete_all
# investigator_json = File.read("db/Investigators.json")
# investigators = JSON.parse(investigator_json)
condition_json = File.read("db/Conditions.json")
conditions = JSON.parse(condition_json)
# binding.pry

# investigators.each do |investigator|
#   Investigator.create(
#     name: investigator["NAME_DEGREE"]
#   )
# end

conditions.each do |condition|
  Illness.create(
    name: condition["CONDITION"]
  )
end

binding.pry

false