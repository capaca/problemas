require 'robo'
require 'controlador'


arquivo = File.new ARGV[0]

controlador = Controlador.new arquivo
controlador.mover_robo

puts "A posi��o atual do robo: #{controlador.posicao_robo}"

