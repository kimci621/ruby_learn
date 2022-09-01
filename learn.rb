# Вывод в консоль
# puts "start" вывод каждого элемента с новой строки
# print "start" вывод каждого элемента в одну строку
# p "start" вывод каждого элемента с новой строки вместе с его типом
# pp "start" вывод каждого элемента с новой строки вместе с его типом в красивом формате
# Узнать все методы литерала в irb el.*tab**tab*
# Узнать тип литерала el.class

#!!! NUMERIC INTEGER NUMBER
a = 3
b = 3 ** 3
# увеличивать значение присваивая новое
a += 3
# при обычном сценарии возвращает целое число
bb = 1 / 5
# при при преобразовании во Float вернет с остатками
bb = 1 / 5.0

#!!! String
c = "old"
# Присваимаем в строку новую
d = c << "new"
#!!! Интерполяция
# Интерполируем в строку переменную
# Интерполяция обязательна в двойных ковычках, в одинарных ruby будет читать как обычную строку
cc = "next string #{d} intepolated"
# to_s преобразует в строку (происходит автоматически, т.е действие внизу лишнее), есть еще to_i и тд
dd = "was numeric #{a.to_s}"
# В ruby у всех переменных есть внутренний id и все они по сути не равно, на сравнение идет по знаечнию
cnew = "old"
cnew == c #true

#!!! Symbol
key = :key
key2 = :key2

#!!! Array
ar = [1,2,3]
ar2 = [2,3,4]
# сохраняем уникальные значения
ar3 = ar | ar2
# сохраняем повторяющиеся значения
ar4 = ar & ar2
# сохраняем все значения
ar5 = ar4 + ar3
# добавляем новое значение в конец массива
ar << 4
ar << 5
# проверяем на наличие значения в массиве
# puts(ar.member? 5)
#сортируем массив
ar5.sort()
# удаляем значение из массива
ar.delete(1)
# удаляем значение из массива
ar.size()
#выбор елемента
var = ar[0]
#выбор елементов со второго пять штук
var2 = ar[2, 5]
#присвоение 1 и 2 элементов в переменные
var3, var4 = ar
#присвоение 1 элем для первой переменной и 2 и более во вторую переменную
var5, *var6 = ar
# puts(ar,ar2,ar3,ar4,ar5,var,var2,var3,var4,var5,var6)

#!!! RANGE
r = (1...10).to_a
# можно вырезать текст
qq = "asdfghjklzxc"[0...6]
# можно вырезать элементы из массива
# puts ar[0..3]
# .. включая второй указанный элемент
# ...  не включая второй указанный элемент

#!!! HASH
# Массив с ключами
# СЕЙЧАС принято записывать как {key: value} , key: == :key
# Обычный синтаксис {:key => value}
keys = {keyword: "value1", keyword2: "value2"}
keysOld = {:keyword => "value1", :keyword2 => "value2"}
# puts keys[:keyword]
# puts keysOld[:keyword]
keys[:newkeyword] = "newValue"
# puts keys
keys.delete(:newkeyword)
# puts keys

#!!! Functions
# Синтаксис стандартной функции
def foo(num)
  return num * num
end
# Можно передать большок кол-во аргументов (вернет массив)
def bar(*args)
  return args.inspect
end
# функция может быть и без скобок и без return, вернется последнее вычесленное значение
def withoutArgs
  "without args and return"
end
# принято, что если в аргументах функции есть hash, то передавать его в аргумент options в виде {key => val}
def withHash (num, options)
  return options.inspect
end
# функция с именнованными аргументами
def foo (arg:)
  pp "This is the argument#{arg}"
end
#foo(arg: "test string")
#Есть некоторые оговоренности при объевлении функций которые возвращают булевое или мутируют переменные
#ставить после имени функции ! для мутирующих
def boolReturns? (arg)
  arg.class == String ? pp('true') : pp('false')
end
# boolReturns?("ASD") # true
# boolReturns?(1) # false
var = "value"
def mutateArg! (arg, val)
  arg.replace(val.to_s)
  puts arg
end
# mutateArg!(var, "NEW")
# pp var
#ставить после имени функции ? для возвращающих булевое
# вызов функции может так же быть без скобок
# puts foo(5)
# puts bar(1,2,3,4,5)
# puts withoutArgs
# puts withHash(1, {"key" => "value"})
# puts withHash(2, {:key2 => "value2"})

#!!! Условные выражения if, bool, ||, &&
#Синтаксис if
def ifShow(num1, num2)
  if (num1 > num2)
    return "more"
  elsif (num1 < num2)
    return "less"
  else
    return "равны"
  end
end
# Отрицающая конструкция unless, вместо if !var -> unless var
# У unless нет elsif, только else
arg = 'asd'
unless arg == 'val' # -> CHECK
  puts "CHECK"
else
  puts "FALSE"
end
#Короткая версия if и unless
puts 'if' if 13 == 13
puts 'unless' unless 13 == 13
#Стандаонтые тернарный оператор
10 == 10 ? puts("ternar") : puts("else ternar")
#САМЫЙ ЛУЧШИ case в мире )))
caseVar = "green"
case  caseVar
when "red"
  puts "color red"
when "green"
  puts "color green"
when "blue"
  puts "color blue"
end
# Идентичны
# puts true && false
# puts true & false
# puts true || false
# puts true | false
# puts ifShow(2,1)

#!!! Lambda функции. Анонимные функции
#Анонимные функции в основном служат чтобы передаваться в аргументы
#функции и производить действия в ее окружении
#Часто можно встретить, что они создаются прямо в теле функции
#Сценарий применения: обработать каждый переданный аргумент функцией и выдать какой-то результат
lambda = -> (arg) {
  puts arg
  return arg
}

def sum_of_range(num1, num2, func)
  if(num1 == num2)
    puts num1.to_s + "=" + num2.to_s + "!!!"
    return num1
  else
    func.call(num1) + sum_of_range(num1 + 1, num2, func)
  end
end

# sum_of_range(1, 10, lambda)

#!!! Окружение и замыкание
# в данном случае лямбда функция в переменной iter нах-ся внутри
# окружения функции factorial, далее она хранит 2 переменные внутри
# себя, она не закончит работу пока условие не выполнится, соответственно
# увеличивая на 1 первую переменную после каждого вызова и храня
# произведение 1и2 во второй переменной
# т.е 1+1,1*1, 2+1,1*2, 3+1,2*3 и тд
def factorial (num)
#Окружение
  iter = -> (curr, acc){
  #Окружение
    if(curr > num)
      puts acc
      return acc
    else
      puts acc.to_s
      iter.call(curr + 1, acc * curr)
    end
  #Окружение
  }
  iter.call(1,1)
#Окружение
end
# factorial(6)
#Любая переменная которая замкнута в определенной области видимости
#считается замыканением, те она сохраняется пока функция работает
ar = [1,2,3,4,5]

#!!! Блоки, Blocks
#!!! Итерации, Циклы
#Block - это отдельный елемент массива, который итерируется
#Есть 3 вида итераций
#Классический, чаще всего используется
ar.each do |el|
  # puts el
end
#Сахар в виде for, почти не используется
for el in ar
  # puts el+1
end
#Специфичный, переназначаем each в виде функции
def each(array)
  for el in array
    # yield передает управление блоком внешнему вызову
    yield el
  end
end

each(ar) do |el|
  # тут все что будет делать yield
  # puts el * el
end

#Есть так же while, until, loop - в отличии от for, each не возвращают перебираемый массив после цикла
count = 1
def show
  while count < 5 do #пока
    count += 1
  end
  until count > 5 do #пока не
    count += 1
  end
  loop do
    count += 1
    break if count == 5
  end
end

#!!! Функциональное программирование
#Некоторые основные методы для работы
str = "lorem ipsum dolores one two fine follow three four"
#split для созлания массива из строки с использованием разделителя
#select для фильтрации массива
#map для создания нового массива из старого с обработкой каждого el
#join для созлания строки из массива с использованием разделителя
#!!Для переноса кода на новую строку используем ->   \
#(&:some_method) -это сахар для {|el| el.some_method()}, но доступпен только для простых методов как reverse, capitalize
# при создании методов можно применять два стандартных приёма — восклицательный
# и вопросительный знак в конце метода. Методы с вопросительным знаком
# традиционно работают как предикаты, то есть возвращают true или false.
# Пример методов-предикатов, — методы массива. восклицательный - отрицает значение
result = str.split(" ").select{|el| !el.start_with?("f")}\
  .map(&:reverse).map(&:capitalize).map(&:reverse)\
  .join(" ")
# puts result

#!!! Предикаты - методы котрые либо проверяют значения и возвращают булевое (?), либо меняют или мутируют (!)
someStr = "string"
someNum = 2
someNum.positive? # -> true
someNum.zero?     # -> false
someNum.negative? # -> false
someStr.upcase    # -> вернет строку с заглавными буквами без мутации самой переменной
someStr.upcase!   # -> вернет строку с заглавными мутировав переменную


#Классы, Classes
class User
end

class Computer
end

class Network
end

class Host
end
# объекты классов
user = User.new
computer = Computer.new
network = Network.new
host = Host.new

#класс с методами этого класса
class User
  def fio
    puts('Name','Surname')
  end
  def profession
    puts "programmer"
  end
end


user = User.new
#обявление объекта класса и вызов его методов
puts "Username is: "
user.fio
puts "His proffession is: "
user.profession
