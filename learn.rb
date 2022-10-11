# frozen_string_literal: true
require_relative 'fileForExport'

# Вывод в консоль
# puts "start" вывод каждого элемента с новой строки
# print "start" вывод каждого элемента в одну строку
# p "start" вывод каждого элемента с новой строки вместе с его типом
# pp "start" вывод каждого элемента с новой строки вместе с его типом в красивом формате
# Узнать все методы литерала в irb el.*tab**tab*
# Узнать тип литерала el.class
# ---------------------------------------NUMERIC INTEGER NUMBER ЧИСЛА-----------------------------------------------------------
# !!! NUMERIC INTEGER NUMBER ЧИСЛА
a = 3
b = 3**3
# увеличивать значение присваивая новое
a += 3
# при обычном сценарии возвращает целое число
bb = 1 / 5
# при при преобразовании во Float вернет с остатками
bb = 1 / 5.0
# -----------------------------------------String Строки---------------------------------------------------------
# !!! String
c = 'old'
# Присваимаем в строку новую
d = c + 'new'
# --------------------------------------------Интерполяция "#{}"------------------------------------------------------
# !!! Интерполяция
# Интерполируем в строку переменную
# Интерполяция обязательна в двойных ковычках, в одинарных ruby будет читать как обычную строку
cc = "next string #{d} intepolated"
# to_s преобразует в строку (происходит автоматически, т.е действие внизу лишнее), есть еще to_i и тд
dd = "was numeric #{a}"
# В ruby у всех переменных есть внутренний id и все они по сути не равно, на сравнение идет по знаечнию
cnew = 'old'
cnew == c # true
# Можно получить часть строки с помощью [], пробелы тоже считаются как символ
cutStr = 'this is full string, this'
p cutStr[5..-1]
# Заменить кусок строки можно методами sub(первый символ) & gsub(все символы)
p cutStr.sub('this', 'new start')
p cutStr.gsub('this', 'new start')
# --------------------------------------------Symbol Символы------------------------------------------------------
# !!! Symbol
# Символы нужно для того чтобы конкретно что-то указать, они не имеют значения. т.е. Если нужно определить понятие белый, можно написать как :white
:white
# if :white do something end
# ---------------------------------------------Array Массивы-----------------------------------------------------
# !!! Array
ar = [1, 2, 3]
ar2 = [2, 3, 4]
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
# сортируем массив
ar5.sort
# удаляем значение из массива
ar.delete(1)
# удаляем значение из массива
ar.size
# выбор елемента
var = ar[0]
# выбор елементов со второго пять штук
var2 = ar[2, 5]
# присвоение 1 и 2 элементов в переменные
var3, var4 = ar
# присвоение 1 элем для первой переменной и 2 и более во вторую переменную
var5, *var6 = ar
# puts(ar,ar2,ar3,ar4,ar5,var,var2,var3,var4,var5,var6)
# -----------------------------------------RANGE---------------------------------------------------------
# !!! RANGE
r = (1...10).to_a
# можно вырезать текст
qq = 'asdfghjklzxc'[0...6]
# можно вырезать элементы из массива
# puts ar[0..3]
# .. включая второй указанный элемент
# ...  не включая второй указанный элемент
# -------------------------------------------HASH ХЕШ ХЭШ-------------------------------------------------------
# !!! HASH. хэш
# Массив с ключами
# СЕЙЧАС принято записывать как {key: value} , key: == :key
# Обычный синтаксис {:key => value}
keys = { keyword: 'value1', keyword2: 'value2' }
keysOld = { keyword: 'value1', keyword2: 'value2' }
# puts keys[:keyword]
# puts keysOld[:keyword]
keys[:newkeyword] = 'newValue'
# puts keys
keys.delete(:newkeyword)
# puts keys
# --------------------------------------------Functions, функции------------------------------------------------------
# !!! Functions, функции
# Синтаксис стандартной функции
# Тк функции по-умолчании возвращает последнее вычисленное выражение, return писать в конце не принято, только если нужно досрочно покинуть метод
def foo(num)
  num * num
end

# Можно передать большое кол-во аргументов (вернет массив)
def bar(*args)
  args.inspect
end

# функция может быть и без скобок и без return, вернется последнее вычесленное значение
def withoutArgs
  'without args and return'
end

# принято, что если в аргументах функции есть hash, то передавать его в аргумент options в виде {key => val}
def withHash(_num, options)
  options.inspect
end

# функция с именнованными аргументами
def foo(arg:)
  pp "This is the argument#{arg}"
end

# foo(arg: "test string")
# Есть некоторые оговоренности при объевлении функций которые возвращают булевое или мутируют переменные
# ставить после имени функции ! для мутирующих
def boolReturns?(arg)
  arg.instance_of?(String) ? pp('true') : pp('false')
end
# boolReturns?("ASD") # true
# boolReturns?(1) # false
var = 'value'
def mutateArg!(arg, val)
  arg.replace(val.to_s)
  puts arg
end

# Чтобы удалить метод пишем ключевое слово undef method_name, и метод будет удален из памяти

# mutateArg!(var, "NEW")
# pp var
# ставить после имени функции ? для возвращающих булевое
# вызов функции может так же быть без скобок
# puts foo(5)
# puts bar(1,2,3,4,5)
# puts withoutArgs
# puts withHash(1, {"key" => "value"})
# puts withHash(2, {:key2 => "value2"})
# ---------------------------------------------Условные выражения if, bool, ||, &&-----------------------------------------------------
# !!! Условные выражения if, bool, ||, &&
# Синтаксис if
def ifShow(num1, num2)
  if num1 > num2
    'more'
  elsif num1 < num2
    'less'
  else
    'равны'
  end
end
# Отрицающая конструкция unless, вместо if !var -> unless var
# У unless нет elsif, только else
arg = 'asd'
if arg == 'val'
  puts 'FALSE'
else # -> CHECK
  puts 'CHECK'
end
# Короткая версия if и unless
puts 'if' if 13 == 13
puts 'unless' unless 13 == 13
# Стандартный тернарный оператор
10 == 10 ? puts('ternar') : puts('else ternar')
# САМЫЙ ЛУЧШИ case в мире )))
caseVar = 'green'
case caseVar
  when 'red'
    puts 'color red'
  when 'green'
    puts 'color green'
  when 'blue'
    puts 'color blue'
end
# Идентичны
# puts true && false
# puts true & false
# puts true || false
# puts true | false
# puts ifShow(2,1)
# -------------------------------------------Lambda(лямбда) функции. Анонимные функции-------------------------------------------------------
# !!! Lambda функции. Анонимные функции
# Анонимные функции в основном служат чтобы передаваться в аргументы
# функции и производить действия в ее окружении
# Часто можно встретить, что они создаются прямо в теле функции
# Сценарий применения: обработать каждый переданный аргумент функцией и выдать какой-то результат
lambda = lambda { |arg|
  puts arg
  return arg
}

def sum_of_range(num1, num2, func)
  if num1 == num2
    puts "#{num1}=#{num2}!!!"
    num1
  else
    func.call(num1) + sum_of_range(num1 + 1, num2, func)
  end
end

# sum_of_range(1, 10, lambda)
# --------------------------------------------- Окружение и замыкание-----------------------------------------------------
# !!! Окружение и замыкание
# в данном случае лямбда функция в переменной iter нах-ся внутри
# окружения функции factorial, далее она хранит 2 переменные внутри
# себя, она не закончит работу пока условие не выполнится, соответственно
# увеличивая на 1 первую переменную после каждого вызова и храня
# произведение 1и2 во второй переменной
# т.е 1+1,1*1, 2+1,1*2, 3+1,2*3 и тд
def factorial(num)
  # Окружение
  iter = lambda { |curr, acc|
    # Окружение
    if curr > num
      puts acc
      return acc
    else
      puts acc.to_s
      iter.call(curr + 1, acc * curr)
    end
    # Окружение
  }
  iter.call(1, 1)
  # Окружение
end
# factorial(6)
# Любая переменная которая замкнута в определенной области видимости
# считается замыканением, те она сохраняется пока функция работает
ar = [1, 2, 3, 4, 5]
# -------------------------------------------Блоки, Blocks-------------------------------------------------------
# !!! Блоки, Blocks
# !!! Итерации, Циклы
# Block - это отдельный елемент массива, который итерируется
# Есть 3 вида итераций
# Классический, чаще всего используется
ar.each do |el|
  # puts el
end
# Сахар в виде for, почти не используется
ar.each do |el|
  # puts el+1
end
# Специфичный, переназначаем each в виде функции
def each(array, &block)
  array.each(&block)
end

each(ar) do |el|
  # тут все что будет делать yield
  # puts el * el
end

# Есть так же while, until, loop - в отличии от for, each не возвращают перебираемый массив после цикла
count = 1
def show
  count += 1 while count < 5 # пока
  count += 1 until count > 5 # пока не
  loop do
    count += 1
    break if count == 5
  end
end
# с помощью break можно остановить цикл
# с помощью next можно остановить и`терацию
# --------------------------------------------Функциональное программирование------------------------------------------------------
# !!! Функциональное программирование
# Некоторые основные методы для работы
str = 'lorem ipsum dolores one two fine follow three four'
# split для созлания массива из строки с использованием разделителя
# select для фильтрации массива
# map для создания нового массива из старого с обработкой каждого el
# join для созлания строки из массива с использованием разделителя
# !!Для переноса кода на новую строку используем ->   \
# (&:some_method) -это сахар для {|el| el.some_method()}, но доступпен только для простых методов как reverse, capitalize
# при создании методов можно применять два стандартных приёма — восклицательный
# и вопросительный знак в конце метода. Методы с вопросительным знаком
# традиционно работают как предикаты, то есть возвращают true или false.
# Пример методов-предикатов, — методы массива. восклицательный - отрицает значение
result = str.split(' ').reject { |el| el.start_with?('f') }\
            .map(&:reverse).map(&:capitalize).map(&:reverse)\
            .join(' ')
# puts result

# !!! Предикаты - методы котрые либо проверяют значения и возвращают булевое (?), либо меняют или мутируют (!)
someStr = 'string'
someNum = 2
someNum.positive? # -> true
someNum.zero?     # -> false
someNum.negative? # -> false
someStr.upcase    # -> вернет строку с заглавными буквами без мутации самой переменной
# someStr.upcase!   # -> вернет строку с заглавными мутировав переменную
# ---------------------------------------------- Классы, Classes---------------------------------------------------
# Классы, Classes
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

# класс с методами этого класса
class User
  def fio
    puts('Name', 'Surname')
  end

  def profession
    puts 'programmer'
  end
end

user = User.new
# обявление объекта класса и вызов его методов
# puts "Username is: "
# user.fio
# puts "His proffession is: "
# user.profession
# ---------------------------------------------Утилиты и гемы-----------------------------------------------------
# Утилиты и гемы
# ruby - сам интерпритатор
# irb - интерактивный терминал руби
# ri - утилита для чтения консольной локументации
# rdoc - утилита для формировании документации
# rake - Утилита для выполнения задач
# erb - Шаблонизатор, позволяет выполнять ruby-код в файлах, записывается в тэги <% ruby code %>
# gem - Утилита для установки сторонних библиотек

# erb важная утилита -  можно вставлять например в erb файлах ruby код который там будет выполнятся
# <% %> для вычисления руби выражения
# <%= %> для подстановки результата вычисления руби выражения
# -----------------------------------------Rake----------------------------------------------------------
# rake = ruby make, утилита нужня для выполнения последовательности действий
# Для того чтобы вослпользоваться rake, нужно создать кофигурационный Rakefile
# создал Rake-файл с примерно таким содержимым:
# task :purchaseDrinks do
#   puts "Купил напитки"
# end

# task :mixDrink do
#   puts "Замешал коктейль 'Миксовый микс'"
# end

# task :getFinal do
#   puts "Вот это ты намешал..."
# end

# После   этого   я   могу  исполнять  эти  задания(находясь  в  той  же
# директории), что-то типа такого:
# rake purchaseDrinks
# rake mixDrink
# rake getFinal
# --------------------------------------------Gems Гемы------------------------------------------------------
# rubygems.org
# gem - инструмент для скачивания, поиска, установки гемов(библиотек) для руби
# gem install some   - установка
# gem search some    - поиск в сети
# gem search -l some   - поиск в локальных гемах
# gem gem list -l    - все локальные гемы
# gem unistall some    - удалить гем
# --------------------------------------------Отладка------------------------------------------------------
# Отладка при помощи гемов pry и pry-byebug
# 1) импортируем сам pry - require 'pry'
# 2) ставим точки остановы  binding.pry
# 3) запускаем файл
# * pry-byebug - добавляет функционал перехода к следующей точке остановы при помощью next, другую инфа в доках
# binding.pry
# ------------------------------------------Контроль написания кода, валидация, форматирование--------------------------------------------------------
# КОнтроль стиля, все соглашения в https://github.com/arbox/ruby-style-guide/blob/master/README-ruRU.md
# можно использовать rubocop(показывает где улучшить, есть автоулучшения)
# rubocop - показать возможные исправления
# rubocop --help - показать все доступное
# rubocop -a - автоисправление
# ---------------------------------------------bundler-----------------------------------------------------
# управление гемами с bundler
# budler чтобы не писать и не устанавливать каждый гем вручную в проекты, bundler сохраняет в Gemfile гемы
# при помощи bundle init можно создать Gemfile
# и может переиспользоваться в проектах и устанавливаться с bundle install
# можно устанавливать готовые гемы с написанием url прямо в Gemfile
#   source 'https://rubygems.org'
#   git_source(:github) {|repo_name| "https://github.com/#(reponame)"}
# Gemfile.lock - фиксирует установленные гемы в проекте
# ----------------------------------------------Предопределенные классы(Типы)----------------------------------------------------
# Предопределенные классы
# В руби нет типов, их роль выполняют классы объектов
puts 3.class #Integer

# Один объект может менять свой класс
# Основные классы в Ruby
# String - 'some string'
# Symbol - :someSymbol
# Integer - 12
# Float - 10.432
# Range - 1...2, 1..2
# Array - [1,2,3,4]
# Hash - {foo: bar, and: 'some'}
# NilClass - nil
# TrueClass, FalseClass - true,false
# ----------------------------------------Heredoc operator << для многострочного текста----------------------------------------------------------
# Heredoc operator <<here text here
# Идеально подходит для большого текста, сохраняет отступы и переносы строк
heredocText = <<here
lorem ipsum dolores
new lorem ipsu,
here
# pp heredocText
# ---------------------------------------системные команды в терминале ``-----------------------------------------------------------
# В косых ковычках можно писать команды терминала операционной системы
# p `ls`
# --------------------------------------------Переменные------------------------------------------------------
# Переменные
#  Переменные бывают 4 типов:
# local - живут локально и не могут быть использованы в теле методов и тд, если объявлены не в них, даже в сущностях класса
# $global - живут глобально, доступны из любой точки программы
# @object - живут в глобальном пространстве в пределах одного объекта и его наследниклов, т.е доступен в сущностях Класса, наследники класса не могут изменить эту переменную вне своей области
# @klass - живут в глобальном пространстве в пределах одного объекта и его наследниклов, т.е доступен в сущностях Класса, наследники класса меняют значение переменной для всех связанных наследников и родителя.(Т.Е переменная глобальна в пределах класса и его сущностей)
# CONSTANTS - константы неизменяемые переменные-коснтанты, принято писать заглавными буквами(на самом деле их значение можно перезаписать, но система даст об этом знать)
# -------------------------------------------Импорт, Экспорт файлов-------------------------------------------------------
# Импорт файлов в другие файлы - require, load
# Чтобы импортировать код из другого файла в проекте используют require или load
# require запускается единожды
# Для того чтобы код импортируемого файла зпускался при каждом включении программы, импортируем с load
# локальные переменные игнорируется при импорте, ruby игнорирует любые строчные литералы
# require './somefile'
# load './somefile'
# Принято не писать расширение, тк могут импортироваться файлы разных библиотек
# В выше указанных способах, путь нужно указывать абсолютно
# В require_relative можно указать относительный путь, те только имя файла
# require_relative 'somefile'
p SOMECONST

hereClass = TestImport.new
hereClass.show
# -------------------------------------------Операторы-------------------------------------------------------
# Операторы
# Оператор параллельного присваивания, обмен значениями
a = 'qwe'
b = 'asd'
a,b = b,a
fsd,snd,trd = ['hello', 'world', '!!!']
# print fsd,snd,trd
# a = asd, b = qwe
# Оператор *, разделяет элемент массива на состовляющие
# pp *['1', '2', '3']
print [*'а'..'я']
# Некоторые операторы сравнения
# <==> возвращает -1 если левый меньше, 0 если оба равны, 1 если левый больше
# =~ true, если соответсвует регулярному выраджению
# !~ true, если не соответсвует регулярному выраджению
# === равентсво для перегрузки классов
# Оператора defined?
# Проверяет существование объекта в программе
pp defined? a #local-variable
pp defined? adfsdjkfh #nil
# методы defined?
# local_variable_defined? var
# instance_variable_defined? @var
# class_variable_defined? @@var
# const_defined? VAR
# Отрицание, вместо != можно использовать ключевое слово not
# if not false   # true
#   puts 'not keyword'
# end
# ------------------------------------------остановка программы руби в терминале--------------------------------------------------------
# Чтобы остановить программу можно использовать методы abort, exit, exit!
# Чтобы выполнить что-нибудь перед завершением работы программы, пишем код в метод at_exit { puts 'programm is exit now' }
# abort - сразу завершит программу
# exit - выполнить сначала метод at_exit, потом завершит программу
# exit! - закроет программу, пропустив at_exit
# -----------------------------------------Логические методы(проверка значений на true || false)---------------------------------------------------------
# Логические методы  - нужны для проверки свойства объекта
# Некоторые из них
# belong_to? - может ли метод применен к объекту
# even? - четность числа
# odd? - нечетность числа
# nan? - допустимо ли число
# nil? является ли объект nil
# zero? является число 0
# positive? число больше нуля
# negative? число меньше 0
# Можно создавать свои логические методы написав в конце названия метода "?"
# def testLogicMethod? arg
#   if arg.class == String
#     puts true
#   else
#     puts false
#   end
# end
# testLogicMethod? "word" # true
# testLogicMethod? 1 # false

# bang методы с "!" в конце, мутируют значение объекта на котором был вызван
# var = 'text'
# var.upcase # вернет новую строку
# var.upcase! # мутирует строку в var
# -------------------------------------------Block, Блоки : yield, класс Proc (Блоки подробно)-------------------------------------------------------
# Block, Блоки : yield, класс Proc
# очень хорошая статься https://medium.com/@askhat/%D1%80%D1%83%D0%B1%D0%B8-%D0%B1%D0%BB%D0%BE%D0%BA%D0%B8-%D0%B7%D0%B0-5-%D0%BC%D0%B8%D0%BD%D1%83%D1%82-67317803210
# Блок это просто код который вы ставите между do и end. Вот и всё
# Блок можно записать двумя способами: (1) многострочный, между do и end, и (2) однострочный, между { и }
# если строк больше чем 1, используем конструкцию  do || some end для блока
[1, 2, 3,].each do |n|
  puts "Number #{n}"
end
# если строка 1, используем конструкцию в {},т.е. {|i| do i.show } для блока
[1, 2, 3].each { |n| puts "Number #{n}" }
# yield, некий отложенный способ вызывать код в теле метода, для этого используют ключевое слово yield или класс Proc
# Когда выполнение yieldTest достигает строчки где вызывается yield, выполняется код из переданного блока. После, когда выполнение кода из блока заканчивается, выполнение yieldTest продолжается.
def yieldTest
  puts 'hello'
  yield
  puts 'world'
end
system('cls')
yieldTest {puts 'its yield'}
yieldTest do 
  puts '123'
end
# Выполняется первая строка в методе, далее блок который передается в аргумент метода на место yield и затем послледняя строка
# yield работает как метод и в него можно передавать аргументы
# примеры использования
def yieldWithArg
  n = 1
  yield n
end
def yieldWithManyArg
  n = 1
  m = 100
  yield n, 'second arg', m
end

def incForYield arg
  arg += 1
end

yieldWithArg {|i| puts "#{incForYield i}"}

yieldWithManyArg do |i, j, k|
  puts "#{i}", "#{j}", "#{k}"
end
# Можно использовать проверку на передачу блока методу, если в методе есть вызов блока, то передача аргумента для него обяхательна
def if_yield_in
  yield if block_given?
  puts "Привет из метода"
end
# функционал максимально похож на callback, т.е. yield - это функции внутри функций, которые что-то делают либо в изоляции от внешней функции, либо что-то принимая и отрабатывая от нее
# блок можно создать с помощью класса Proc
block = Proc.new {|i| i.even?}
# block - это пустой блок, который принимает в себя аргумент и возвращает его если он четный(even)
p [*1..10].select(&block)
p [*1..10].select(&:even?) #эквивалентно верхнему, &: - символ блока
# Метод select может принимать блок или символ блока(&) для выбора элементов по критерию
# На практике Proc.new используется редко и вместо него берут методы proc и lambda
system 'cls'
pr = proc {|i| i * 2}
lb = lambda {|i| i * 4}
[1,2,3,4,5].each do |el|
  p pr.call el
end
p pr.call 3
p lb.call 5
# Что такое &block - Это то как вы можете передать указатель на блок (вместо локальной переменной) в качестве параметра функции. Руби позволяет передать любой объект методу как если бы этот объект был блоком
# однако если объект не блок, то на объекте будет вызван to_proc в попытке конвертировать его в блок
def my_method123(&block)
  puts block
  block.call
end
# call — тоже что и yield, это намного читабельнее, тк по сути тут блок.вызвать()
# yield и arg.call возвращает последнее рассчитанное выражение (изнутри блока)
def my_method(&block)
  value = block.call
  puts "value is: #{value}"
end
my_method {2}
some = ['scf', 'asdc']
# Есть такие конструкции в методах как 
some.map(&:capitalize) 
# Это то же самое что и 
some.map { |title| title.capitalize }
# Сделаем что-то пдобное как .map
def my_map(array)
  new_array = []
  
  for element in array
    new_array.push yield element
  end
  
  new_array
end

my_map([1,2,3]) do |number|
  number * 2
end
system 'cls'
# можно думать о блоках просто как о кусках кода, а yield, arg.call как о способе вводить этот код в произвольное место в методе
# -------------------------------------------Class, Классы (подробно)-------------------------------------------------------
# Class, Классы
# Классы позволяють создавать объекты, до сих пор были только предопределенные классы
class HelloWorld
  def say
    puts 'hello'
  end
end
# HelloWorld = Class.new do
#   def say
#     puts 'hello'
#   end
# end

hello = HelloWorld.new
hello.say
# class это объект (помним что все объект)
# В Руби можно переопределять методы классов а так же классов самого руби
p 'asdf'.reverse
class String
  # def reverse
  #   'Все сломал'
  # end 
end
p 'asdf'.reverse
# Поэтому не стоит так делать))), но можно добавить и свой метод в String например
class String
  def customMenthod
    split('')[0]
  end
end
p 'asdf'.customMenthod
# Тело класса является блоком и туда можно писать любой код, в тч и обычные принты,путсы, циклы и тд
# В классе может быть и вложенный класс
system 'cls'
class Auto
  def color
    'black'
  end

  def build 
    @engine = Engine.new
  end

  def engine
    @engine
  end

  class Engine
    def power 
      '250'
    end
  end
end

Volvo = Auto.new
Volvo.build
p Volvo.color
p Volvo.engine.power
# @param - исп для других методов в пределах текущего класса
# @@param - исп для класса и его сущностей и в любых методах в них
# Чтобы напрямую обратиться до вложенного класса используем конмтрукцию  ParentClass::ChildClass
PowerOfEngine = Auto::Engine.new
p PowerOfEngine.power
# КОНСТАНТЫ так же доступны через :: (оператор разрешения области видимости), и для просмотра необязательно объявлять класс
class Auto 
  SOMECONST = 'test constant in class'
  class Engine
    DEEPERCONST = 'deeper test constant in class'
  end
end
p Auto::SOMECONST
p Auto::Engine::DEEPERCONST
# ---------------------------------------------Методы классов-----------------------------------------------------
system 'cls'
# Методы класса
# Для передачи классу аргументов и запуску всегда на первом месте по-умолчание используется метод класса initialize
class InitTest
  def initialize arg1, arg2
    puts 'class ready to work'
    puts 'class get to work first argument: ',"#{arg1}",' and second argument: ', "#{arg2}"
  end
  def getSome
    'some'
  end
end

ReadyToTest = InitTest.new(1234, 'testtest')
p ReadyToTest.getSome
# если в initialize указать аргументы, то необходимо их указывать при вызове, обязательно (но можно и передать аргументам значения по=умолчанию как в обычном методе)
# Как работает метод .new - new по-сути вызывает 2 метода allocate и initialize, allocate - размещает объект в памяти, initialize - конструктор
# Чтобы доставать и менять инстанс переменную класса, пользуемся стандартными геттером и сеттером
class GetAndSet
  def initialize arg='none'
    puts 'testing getter and setter'
    @arg = arg
  end
  def arg
    @arg
  end
  def set_arg newArg
    @arg = newArg
  end
end

TestGaS = GetAndSet.new 'foo'
p TestGaS.arg
TestGaS.set_arg 'bar'
p TestGaS.arg
# Вместо нейминга сеттера вида set_ можно импользовать arg= newArg, руби позволяет и выглядит логично для сеттера
# Вместо того чтобы писать геттер и сеттер вручную, сообщество решило это двумя способами
# 1) attr_writter :price, :count
#    attr_reader  :price, :count
# 2) Если геттеры и сеттреы идентичны
#    attr_accessor :price, :count
# Все эти методы автоматически создают геттер(name) и сеттер(name=)
class Cls 
  attr_accessor :price, :count
  def initialize(price: 500, count: 999)
    @price = price
    @count = count
  end
end
newCls = Cls.new
p newCls.price
p newCls.count
newCls.price= 1999
newCls.count= 22
p newCls.price
p newCls.count
# Очень просто, быстро и лаконично
# ---------------------------------------------Синглтон методы классов-----------------------------------------------------
# Синглтон методы классов это методы которые вызываются исключительно на объекте класса, т.е сами они вызываться не могут
# У объектов класса есть обычный класс и метакласс, в иетаклассе как раз будут храниться эти самые синглтон методы
# Метакласс - абсолютно такой же класс и может быть со своими геттерами, сеттерами, initialize методом и тд
# Синглтон методы объявляются двумя способами
system 'cls'
class Cls 
  attr_accessor :arg
  def initialize arg: 'none'
    @arg = arg
  end
end
objOfCls = Cls.new(arg: 'arg for Class Object')
# Первый способ синглтон метода
def objOfCls.singletonFirst
  'Есть синглтон метод!'
end
# Второй способ синглтон метода
class << objOfCls
  def singletonSecond
    'Есть синглтон метод 2'
  end
end

# respond_to? - относится ли метод к Объекту  
puts 'true' if objOfCls.respond_to? :singletonFirst
puts 'true' if objOfCls.respond_to? :singletonSecond
# --------------------------------------Классы - тоже объекты и уних есть общие методы----------------------------------------------
# Например метод .new()
# Кроме того так же у каждого класса есть метакласс, в котором так же распологаются синглтон методы, только в случае классов - это просто методы класса
system 'cls'
class HelloWorld
end

def HelloWorld.hello
  puts 'Hell world'
end

HelloWorld.hello
HelloWorld::hello
# Можно использовать :: для обращения к методам класса, но лучше исп точку, тк :: сразу намекают на КОНСТАНТУ
# Методы класса можно создавать прямо к теле класса и это уже будет не инстанс-методом объекта, а методом класса к которому можно обращаться напрямую
class Hello
  def Hello.say
    puts 'hello i am class-method'
  end

  def instanceMethod
    'hello i am instance-method'
  end
end

Hello.say
instanceHello = Hello.new
p instanceHello.instanceMethod
# Таким образом в классе можно создаать два типа методов, инстанс-метод объекта и метод класса
# ОБЪЕКТ -> КЛАСС[метаКласс] -> ОБЪЕКТ КЛАССА[метаКласс]
# В объекте инстанс методы и напрямую к ним не достучаться, только из объекта класса
# А методы класса в метаКлассе и к ним есть доступ напрямую
# Еще вместо того чтобы писать название класса в теле, можно писать ключевое слово self
system 'cls'
class Hello
  def self.say
    puts 'hello i am class-method'
  end

  def instanceMethod
    'hello i am instance-method'
  end
end
Hello.say
instanceHello = Hello.new
p instanceHello.instanceMethod
# Метожы можно создавать не только "классичсекими способами", есть создание метода через define_method
system 'cls'
class Hello
  define_method :hello do |arg|
    puts arg
  end
end
# То же самое что
class Hello
  def hello arg
    puts arg
  end
end
instanceHello = Hello.new
instanceHello.hello 'hi there!'
# Обычно define_method не используется ввиду его сложной читабельности, но он полезен наример для создания многих однотипных методов
system `cls`
class Rainbow
  COLORS = {
    red: 'красный',
    orange: 'оранжевый',
    yellow: 'желтый',
    green: 'зеленый',
  }

  COLORS.each do |key, value|
    define_method key do
      value
    end
  end
end

r = Rainbow.new
puts r.red
puts r.orange
puts r.yellow
puts r.green
# --------------------------------------Преобразование объектов----------------------------------------------
system 'cls'
# Сложение одинаковых типов данных дают их сумму, как и везде
p 1 + 1
p 'foo' + 'bar'
# В руби нелься складывать разные типы объекта
# 1 + 'tv' #string cant be coerced to integer и наоброт
# Поэтому задаем явное преобразование объека
p 1.to_s + ' tv'
# to_s - String
# to_i - Integer
# to_a - Array
# to_h - Hash
# to_f - Float
# to_sym - Symbol
d = Time.now
p d.to_a[3].to_s + " " + d.to_a[4].to_s + " " + d.to_a[5].to_s # "9 10 2022"
# --------------------------------------Ключевое слово self----------------------------------------------
# self ссылается на текущий объект, где исполняется
# в теле класса на сам Класс, в глобале на глобальный объект main
# 1) Глобальный область видимости - на глобальный Объект Main 
# 2) Инстанс-метод - На супер-класс
# 3) Уровень класса или модуль - на Класс::уровень класса, на Класс::модуль
# 4) Синглтон метод - на вызываемый объект
class Cls 
  puts self
  def inst
    puts self
  end
  module Some
    puts self
  end
  def Cls.sing
    puts self
  end
end
puts self #main
Cls.sing #Cls
p Cls::Some #Cls::Some

newCls = Cls.new
newCls.inst #<Cls:0x000001a787678dd0> т.е. Cls
# --------------------------------------Цепочка обязаностей, chaining----------------------------------------------
system 'cls'
# В руби методы можно вызывать друг за другом в одной строке как:
p 'hello'.capitalize.reverse
# Для этого метод должен возвращать сам Класс для того чтобы можно было дальше вызывать его методы
class Chaining
  attr_accessor :arg
  def initialize arg: false
    @arg = arg 
  end

  def firstChain
    puts 'first chain'
    self #return Chaining
  end

  def secondChain
    puts 'secind chain'
    self #return Chaining
  end
end

test = Chaining.new(arg: 'my argument')
test.firstChain.secondChain
# Инициализация объекта в качестве блока
class BlockCls
  attr_accessor :price, :test
  def initialize
    yield self #исполни самого себя в блоке
  end
end
newBlockCls = BlockCls.new do |i| #Класс вернулся в блок, в данном случае как i
  i.price = 100
  i.test = 'test'
end
p newBlockCls.price
p newBlockCls.test
# self используют и для открытия классов
class String 
  def hello
    puts self + " hello!"
  end
end

'asdf'.hello
# Все как в this, но гораздо логичнее)))
# --------------------------------------Перегрузка опрераторов с self----------------------------------------------
system 'cls'
class Overload 
  attr_accessor :num
  
  def initialize num: 0
    @num = num
  end
  
  def +(num)
    @num += num
    self
  end

end

newOverload = Overload.new
newOverload.+ 100
newOverload.+ 666
pp newOverload.num
# --------------------------------------Класс как блок----------------------------------------------
system 'cls'
class LikeABlock
  attr_accessor :date, :price
  def initialize 
    yield self
  end
end

likeABlock = LikeABlock.new do |cls|
  cls.date= '22-08-1998'
  cls.price= 9999
end
# likeABlock равно Классу LikeABlock, который запускает метод .new, в котором initialize, который возвращает сам Класс в качестве блока и мы в этот самый блок черех его сеттеры ставим новые значения 
pp likeABlock.date
pp likeABlock.price

# ------------------------------------------------------------------------------------