# Импорт из корневой директории root
require_relative './moduleLearn'
# Импорт из текущей директории 
# require_relative 'moduleLearn'

# импортуруем нелюходимый модуль с помощью  include
include ModuleLearn

# запускаем метод модуля ModuleLearn
methodOfTestModule(5,10)