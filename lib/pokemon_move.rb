class PokemonMove
  attr_reader :name, :power, :type

  def initialize(name, power, type)
    @name = name
    @power = power
    @type = type
    validate
  end

  private
    def validate
      raise "Wrong data type for name or blank" unless @name.class.eql?(String) && @name != ''
      raise "Wrong data type for type or blank" unless @type.class.eql?(String) && @type != ''
      raise "Wrong data type for power or blank" unless @power.class.eql?(Integer)
    end
end