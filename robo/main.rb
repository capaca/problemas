require 'robo'
require 'controlador_de_robo'


puts "Carregando o arquivo..."
arquivo = File.new ARGV[0]

puts "Inicializando o robo..."
controlador = ControladorDeRobo.new arquivo
puts "Movendo o robo..."
controlador.mover_robo

puts "\nO rob� moveu-se at� o ponto: #{controlador.posicao_robo}"

