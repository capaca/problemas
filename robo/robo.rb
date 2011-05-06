class Robo
	
	@@MSG_ERRO = "Não vou me mover além dos limites..."
	
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
	rescue
		puts @@MSG_ERRO
	end
	
	def virar_para_esquerda
		@direcao = case @direcao
			when 'N'
				'L'
			when 'L'
				'S'
			when 'S'
				'O'
			when 'O'
				'N'
			else	
				throw :error
		end
	end
	
	def virar_para_direita
		@direcao = case @direcao
			when 'N'
				'O'
			when 'O'
				'S'
			when 'S'
				'L'
			when 'L'
				'N'
			else	
				raise "error"
		end
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
		else	
			raise "erro"
		end
	rescue
		puts @@MSG_ERRO
	end
	
	def posicao
		"#{@posicao_x},#{posicao_y} #{@direcao}"
	end
	
	private 
	def posicao_x= x
		raise "erro" if x > @limite_x or x < 0
		@posicao_x = x
	end
	
	def posicao_y= y
		raise "erro" if y > @limite_y or y < 0
		@posicao_y = y
	end
end