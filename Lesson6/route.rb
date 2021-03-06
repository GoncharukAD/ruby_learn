class Route
  include InstanceCounter
  NAME_FORMAT = /^[А-Я]{2,15}-+[А-Я]{2,15}$/i

  attr_reader :start, :finish, :stations, :name

  def initialize(start, finish, name)
    @start = start
    @finish = finish
    @name = name
    self.register_instance
    @stations = []
    validate!
    puts "Вы создали маршрут #{start} - #{finish}" if valid? == true
  end

  def valid?
    validate!
    true 
  end 

  def route
    [@start, @stations, @finish].flatten.compact
  end

  def add_station(station_name)
    raise "Станция не относится к классу #{Station}" unless station_name.class == Station
    stations.push(station_name)
  end
  
  def remove_station(station_name)
    if stations.include?
      stations.delete(station_name)
      puts "Станция #{station_name} удалена из маршрута"
    else  
      puts "Cтанции #{station_name} нет в маршруте"
    end    
  end 
  
  protected

  def validate!
    raise "Начальная станция маршрута не была введена" if start.nil?
    raise "Конечная станция маршрута не была введена" if finish.nil?
    raise "Название маршрута не было введено" if name.nil?
    raise "Некорректный формат названия маршрута" if name !~ NAME_FORMAT
  end  
end

