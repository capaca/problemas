class Controlador
	
	def initialize instrucoes
		linhas = instrucoes.readlines

		limite = linhas[0].split ' '
		limite_x = limite[0].to_i
		limite_y = limite[1].to_i

		posicao_inicial = linhas[1].split ' '
		posicao_x = posicao_inicial[0].to_i
		posicao_y = posicao_inicial[1].to_i
		direcao = posicao_inicial[2]
		
		@movimentos1 = linhas[2].strip.chars.to_a
		
		@posicao_t_x = linhas[3].split(' ')[1].to_i
		@posicao_t_y = linhas[3].split(' ')[2].to_i
		
		@movimentos2 = linhas[4].strip.chars.to_a
		
		@robo = Robo.new posicao_x, posicao_y, direcao, limite_x, limite_y
	end
	
	def mover_robo
		mover @movimentos1
		@robo.teletransportar @posicao_t_x, @posicao_t_y
		mover @movimentos2
	end
	
	def posicao_robo
		@robo.posicao
	end
	
	private 
	
	def mover movimentos
		movimentos.each do |c|
			case c
			when 'L'
				@robo.virar_para_esquerda
			when 'R'
				@robo.virar_para_direita
			when 'M'
				@robo.mover_para_frente
			else
				raise "erro"
			end
		end
	end
	
end