class User
  def getName name,surname
    puts "My name is #{name}, surname is #{surname}"
  end
  def getProfession profession
    puts "I am #{profession}"
  end
end

test = User.new
test.getName 'Alexey','Komunyaka'
test.getProfession 'happy maker'
