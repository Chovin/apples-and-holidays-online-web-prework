# require 'pry'  # ~> LoadError: cannot load such file -- pry

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end                                                 # => :second_supply_for_fourth_of_july

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each {|k, v| v << supply}
end                                                      # => :add_supply_to_winter_holidays


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end                                                   # => :add_supply_to_memorial_day

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end                                                                                  # => :add_new_holiday_with_supplies

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end                                            # => :all_winter_holiday_supplies

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize}:"
    holidays.each do |holiday, supplies|
      puts "  #{holiday.to_s.split.map(&:capitalize).join " "}: #{supplies.join " "}"
    end
  end
end                                                                                    # => :all_supplies_in_holidays

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.values.flatten
end                                      # => :all_holidays_with_bbq


{
  :winter => {
    :christmas => ["Lights", "Wreath"],      # => ["Lights", "Wreath"]
    :new_years => ["Party Hats"]             # => ["Party Hats"]
  },                                         # => {:christmas=>["Lights", "Wreath"], :new_years=>["Party Hats"]}
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]  # => ["Fireworks", "BBQ"]
  },                                         # => {:fourth_of_july=>["Fireworks", "BBQ"]}
  :fall => {
    :thanksgiving => ["Turkey"]              # => ["Turkey"]
  },                                         # => {:thanksgiving=>["Turkey"]}
  :spring => {
    :memorial_day => ["BBQ"]                 # => ["BBQ"]
  }                                          # => {:memorial_day=>["BBQ"]}
}.values.flatten(2)                          # => [{:christmas=>["Lights", "Wreath"], :new_years=>["Party Hats"]}, {:fourth_of_july=>["Fireworks", "BBQ"]}, {:thanksgiving=>["Turkey"]}, {:memorial_day=>["BBQ"]}]
