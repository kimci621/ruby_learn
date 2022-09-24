# frozen_string_literal: true

# С помощью rake -T можно вывести все доступные таски c из desc(т.е. описанием)
task default: :load

desc 'Задача по умолчанию'
task :load do
  puts 'initial load of rakefile'
end

desc 'Описание к первой задаче'
task :purchaseDrinks do
  puts 'Купил напитки'
end

desc 'Описание к второй задаче'
task :mixDrink do
  puts "Замешал коктейль 'Миксовый микс'"
end

desc 'Описание к третьей задаче'
task :getFinal do
  puts 'Вот это ты намешал...'
end

desc 'Вывод времени'
task :TimeIs do
  puts Time.now
end

# таски с использованием namespace, передаем аргумент вида имя-namespace/таска-в-ней
task testNameSpace: 'test:load'
# можно вызвать как обычная таска test:load
namespace :test do
  desc 'test namespace task'
  task :load do
    puts 'moretest'
  end
end
