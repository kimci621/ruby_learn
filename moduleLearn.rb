# frozen_string_literal: true

# Модули - это что-то вроде библиотек которые дополняют функциональность, например классов
# Создав модуль и присвоев ему методы и свойства, можно пользоваться им в любом другом файле,
# заранее имортировав модуль с помощью require 'путь', include ModuleName
module ModuleLearn
  def methodOfTestModule(arg1, arg2)
    puts((arg1 + arg2) / 2)
    ((arg1 + arg2) / 2)
  end
end
