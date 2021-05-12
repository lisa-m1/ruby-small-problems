require 'date'

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_the_week, schedule)
    week_day = find_num_week_day(day_of_the_week)
    schedule_flag = convert_schedule(schedule)
    first_day_in_the_month = find_first_day(week_day)
    day = find_day(first_day_in_the_month, schedule_flag)
    return Date.civil(year, month, day) if day

    nil
  end

  def find_num_week_day(day_of_the_week)
    day_of_the_week_downcase = day_of_the_week.downcase
    case day_of_the_week_downcase
    when 'sunday' then 0
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    end
  end

  def convert_schedule(schedule)
    schedule.downcase.to_sym
  end

  def find_first_day(week_day)
    1.upto(7).each do |month_day|
      return month_day if Date.civil(year, month, month_day).wday == week_day
    end
  end

  def find_day(first_day_in_the_month, schedule_flag)
    case schedule_flag
    when :first then first_day_in_the_month
    when :second then first_day_in_the_month + 7
    when :third then first_day_in_the_month + 14
    when :fourth then first_day_in_the_month + 21
    when :fifth then find_fifth(first_day_in_the_month)
    when :last then find_last(first_day_in_the_month)
    when :teenth then find_teenth(first_day_in_the_month)
    end
  end

  def find_fifth(first_day_in_the_month)
    day = first_day_in_the_month + 28
    return day if Date.valid_date?(year, month, day)

    nil
  end

  def find_last(first_day_in_the_month)
    day = first_day_in_the_month + 28
    return day if Date.valid_date?(year, month, day)

    first_day_in_the_month + 21
  end

  def find_teenth(first_day_in_the_month)
    day = first_day_in_the_month
    loop do
      day += 7
      break if (14..19).include?(day)
    end
    day
  end
end
