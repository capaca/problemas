require 'test/unit'
require 'robo'

class RoboTeste < Test::Unit::TestCase
    
    def setup
        @robo = criar_robo
    end
    
    
    def test_virar_para_esquerda
        assert_equal @robo.direcao, 'N'
        
        @robo.virar_para_esquerda
        assert_equal @robo.direcao, 'L'
        
        @robo.virar_para_esquerda
        assert_equal @robo.direcao, 'S'
        
        @robo.virar_para_esquerda
        assert_equal @robo.direcao, 'O'
        
        @robo.virar_para_esquerda
        assert_equal @robo.direcao, 'N'
    end
    
    def test_virar_para_direita
        assert_equal @robo.direcao, 'N'
        
        @robo.virar_para_direita
        assert_equal @robo.direcao, 'O'
        
        @robo.virar_para_direita
        assert_equal @robo.direcao, 'S'
        
        @robo.virar_para_direita
        assert_equal @robo.direcao, 'L'
        
        @robo.virar_para_direita
        assert_equal @robo.direcao, 'N'
    end
    
    def test_mover_para_frente
        assert_equal @robo.direcao, 'N'
        
        @robo.mover_para_frente
        assert_equal @robo.posicao_x, 0
        assert_equal @robo.posicao_y, 1
        
        @robo.virar_para_direita
        @robo.mover_para_frente
        assert_equal @robo.posicao_x, 1      
        assert_equal @robo.posicao_y, 1
        
        @robo.virar_para_direita
        @robo.mover_para_frente
        assert_equal @robo.posicao_x, 1      
        assert_equal @robo.posicao_y, 0
        
        @robo.virar_para_direita
        @robo.mover_para_frente
        assert_equal @robo.posicao_x, 0      
        assert_equal @robo.posicao_y, 0
    end
    
    def test_teletransportar
        assert_equal @robo.posicao_x, 0
        assert_equal @robo.posicao_y, 0
        
        @robo.teletransportar 10,10
        
        assert_equal @robo.posicao_x, 10
        assert_equal @robo.posicao_y, 10
    end
    
    def test_erro_ao_mover_para_fora_do_limite
        assert_equal @robo.posicao_x, 0
        assert_equal @robo.posicao_y, 0
        
        assert_raise MoverAlemDoLimiteException do
            @robo.teletransportar 20,20
        end
        
        @robo.virar_para_esquerda

        assert_raise MoverAlemDoLimiteException do
            @robo.mover_para_frente
        end
        
        @robo.virar_para_esquerda

        assert_raise MoverAlemDoLimiteException do
            @robo.mover_para_frente
        end
        
        assert_equal @robo.posicao_x, 0
        assert_equal @robo.posicao_y, 0
        assert_equal @robo.direcao, 'S'        
    end
    
    def criar_robo
        Robo.new 0,0,'N',10,10
    end

end
