class Clock
  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def to_s
    "#{format("%.2d", hour)}:#{format("%.2d", minutes)}"
  end

  def +(minutes_to_add)
    if minutes + minutes_to_add >= 60
      total_minutes = minutes + minutes_to_add
      add_hours(total_minutes)
      add_minutes(total_minutes)
    else
      self.minutes += minutes_to_add
    end
    self
  end

  def -(minutes_to_subtract)
    if minutes - minutes_to_subtract >= 0
      self.minutes -= minutes_to_subtract
    else
      decrease_hours(minutes_to_subtract)
      decrease_minutes(minutes_to_subtract)
    end
    self
  end

  def add_hours(total_minutes)
    hours_to_add = total_minutes / 60
    self.hour += hours_to_add
    self.hour -= 24 while hour >= 24
  end

  def add_minutes(total_minutes)
    self.minutes = total_minutes % 60
  end

  def decrease_hours(minutes_to_subtract)
    hours_to_subtract = ((minutes_to_subtract - minutes) / 60) + 1
    self.hour -= hours_to_subtract
    self.hour += 24 while hour.negative?
  end

  def decrease_minutes(minutes_to_subtract)
    return if minutes_to_subtract % 60 == 0

    remaining_minutes = minutes_to_subtract % 60
    new_minute = 60 + minutes - remaining_minutes
    self.minutes = new_minute
  end

  def ==(other)
    hour == other.hour && minutes == other.minutes
  end
end
