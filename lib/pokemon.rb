class Pokemon
  attr_reader :name, :moves, :base_def, :type, :base_hp

  def initialize(name, moves, base_def, type, base_hp)
    @name = name
    @moves = moves
    @base_def = base_def
    @type = type
    @base_hp = base_hp
    validate
  end

  def name=(name)
    @name = name
    validate
  end

  def moves=(moves)
    @moves = moves
    validate
  end

  def type=(type)
    @type = type
    validate
  end

  def base_def=(base_def)
    @base_def = base_def
    validate
  end

  private
    def validate
      raise "Wrong data type for name or blank" unless @name.class.eql?(String) && @name != ''
      raise "Wrong data type for moves or empty" unless @moves.class.eql?(Array) && @moves != []
      raise "Wrong data type for type or blank" unless @type.class.eql?(String) && @type != ''
      raise "Wrong data type for base_def or blank" unless @base_def.class.eql?(Integer)
      raise "Wrong data type for base_hp or blank" unless @base_hp.class.eql?(Integer)
    end
end