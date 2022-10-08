class User
  def getName name,surname
    puts "My name is #{name}, surname is #{surname}"
  end
  def getProfession profession
    puts "I am #{profession}"
  end
end

# test = User.new
# test.getName 'Alexey','Komunyaka'
# test.getProfession 'happy maker'
system 'cls'
class Chess
  @@figure = {x: 0, y: 0}

  def moveX
    @@figure[:x] += 1
  end
  def moveY
    @@figure[:y] += 1
  end
  def moveXY
    @@figure[:x] -= 1
    @@figure[:y] += 1
  end
  def moveYX
    @@figure[:x] += 1
    @@figure[:y] += 1
  end
  def showPosition
    print 'x = ', @@figure[:x]
    puts ' '
    print 'y = ', @@figure[:y]
  end
  # И тд
end

Quin = Chess.new
Quin.moveX
Quin.moveYX
Quin.moveY
Quin.moveY
Quin.moveY
Quin.moveXY
Quin.showPosition