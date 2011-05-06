class MoverAlemDoLimiteException < Exception 
end

class Robo
	DIRECOES = ['N','L','S','O']
	
	def initialize posicao_x, posicao_y, direcao, limite_x, limite_y
		@posicao_x = posicao_x
		@posicao_y =  posicao_y
		@direcao = direcao
		@limite_x = limite_x
		@limite_y = limite_y
	end
	
	attr_reader :posicao_x, :posicao_y, :direcao, :limite_x, :limite_y
	
	def teletransportar x, y
		self.posicao_x = x
		self.posicao_y = y
	end
	
	def virar_para_esquerda
		@direcao = calcular_direcao +1
	end
	
	def virar_para_direita
		@direcao = calcular_direcao -1
	end
	
	def mover_para_frente
		case @direcao
		when 'N'
			self.posicao_y = @posicao_y + 1
		when 'O'
			self.posicao_x= @posicao_x + 1
		when 'S'
			self.posicao_y= @posicao_y - 1
		when 'L'
			self.posicao_x= @posicao_x - 1
		end
	end
	
	def posicao
		"#{@posicao_x},#{posicao_y} #{@direcao}"
	end
	
	private 
	def calcular_direcao n
		DIRECOES[(DIRECOES.index(@direcao)+n) % DIRECOES.size] 
	end
	
	def posicao_x= x
		lancar_erro if x > @limite_x or x < 0
		@posicao_x = x
	end
	
	def posicao_y= y
		lancar_erro if y > @limite_y or y < 0
		@posicao_y = y
	end
	
	def lancar_erro
		raise MoverAlemDoLimiteException.new "Não é possivel mover o robo para fora dos limites determinados."
	end
end