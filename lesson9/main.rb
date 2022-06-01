# frozen_string_literal: true

require_relative 'manufacturer_name'
require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'interface'

interface = Interface.new
interface.run
