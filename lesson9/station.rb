# frozen_string_literal: true

class Station
  include InstanceCounter
  include Acсessors
  include Validation

  NAME_FORMAT = /^[a-я]{2,15}$/i.freeze

  attr_reader :name, :trains_list

  validate :name, :presence
  validate :name, :format, NAME_FORMAT
  validate :attribute_class, :type, 'Station'

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains_list = []
    @@all_stations.push(self)
    register_instance
    validate!
    puts "Вы создали станцию #{name}" if valid? == true
  end

  def all
    @@all_stations
  end

  # принимает блок и проходит по всем поездам на станции, передавая каждый поезд в блок.
  def trains_list_actions(&block)
    @trains_list.each(&block)
  end

  def valid?
    validate!
    true
  end

  def arrive(train)
    @train_list.push(train)
  end

  def trains_select(type)
    @trains_list.select { |train| train.type == type }
  end

  def depart(train)
    trains_list.delete(train)
  end

  protected

  def validate!
    raise 'Название станции не было введено' if name.nil?
    raise 'Некорректный формат названия станции' if name !~ NAME_FORMAT
  end
end
