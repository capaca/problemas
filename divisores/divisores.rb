def self.contar_divisores num
	count = 0
	(1..num).each do |n|
		count += 1 if num % n == 0
	end
	return count
end

def quem_tem_mais? num1, num2
	num_div1 = contar_divisores(num1)
	num_div2 = contar_divisores(num2)
	
	return num1 if(num_div1 > num_div2)
	return num2 if(num_div2 > num_div1)
	return "iguais"
end
