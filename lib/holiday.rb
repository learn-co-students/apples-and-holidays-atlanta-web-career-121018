require 'pry'

  holiday_supplies =
    {
      :winter => {
        :christmas => ["Lights", "Wreath"],
        :new_years => ["Party Hats"]
      },
      :summer => {
        :fourth_of_july => ["Fireworks", "BBQ"]
      },
      :fall => {
        :thanksgiving => ["Turkey"]
      },
      :spring => {
        :memorial_day => ["BBQ"]
      }
    }

  supply = "ballons"


def second_supply_for_fourth_of_july(holiday_hash)
    return holiday_hash[:summer][:fourth_of_july][1]
end



def add_supply_to_winter_holidays(holiday_hash, supply)
    # holiday_hash is identical to the one above
    # add the second argument, which is a supply, to BOTH the
    # Christmas AND the New Year's arrays
    holiday_hash.each {|season, holiday| season == :winter ? holiday.each{|days, supplies| supplies << supply} : nil}
    ##===OR===##
    # holiday_hash.each do |season, holiday|
    #     if season == :winter
    #         holiday.each do |days, supplies|
    #             supplies << supply
    #         end
    #     end
    # end
end



def add_supply_to_memorial_day(holiday_hash, supply)
    # again, holiday_hash is the same as the ones above
    # add the second argument to the memorial day array
    holiday_hash.each {|season, holiday| season == :spring ? holiday.each{|days, supplies| supplies << supply} : nil}
    ##===OR===##
    # holiday_hash.each do |season, holiday|
    #     if season == :spring
    #         holiday.each do |days, supplies|
    #             supplies << supply
    #         end
    #     end
    # end
end



def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
    # remember to return the updated hash

    holiday_hash[season] = {holiday_name => supply_array}
    holiday_hash
end



def all_winter_holiday_supplies(holiday_hash)
    # return an array of all of the supplies that are used in the winter season
    # holiday_hash.each {|season, holiday| season == :winter ? holiday.values.flatten : nil}
    holiday_hash.each do |season, holiday|
        if season == :winter
            return holiday.values.flatten
        end
    end
end



def all_supplies_in_holidays(holiday_hash)
    # iterate through holiday_hash and print items such that your readout resembles:
    # Winter:
    #   Christmas: Lights, Wreath
    #   New Years: Party Hats
    # Summer:
    #   Fourth Of July: Fireworks, BBQ
    # etc.

    holiday_hash.each do |season, holiday|
        puts "#{season.to_s.capitalize!}:"
        holiday.each do |day, list|
            puts "  #{day.to_s.split("_").collect {|day| day.capitalize!}.join(" ")}: #{list.join(", ")}"
        end
    end
end

def all_holidays_with_bbq(holiday_hash)
    # return an array of holiday names (as symbols) where supply lists
    # include the string "BBQ"
    holiday_hash.map {|season, holiday| holiday.map {|day, list| list.include?('BBQ') ? day : nil }}.flatten.compact
    ##===OR===##
    # holiday_hash.map do |season, holiday|
    #     holiday.map do |day, list|
    #         day if list.include?("BBQ")
    #     end
    # end.flatten.compact
end
