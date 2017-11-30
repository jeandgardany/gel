module StocksHelper
	def format_category(category)
		if category == 'Materiais'
			'Mat'
		else
		'Eqp'
		end
		
	end
	def format_employee_name
		if self.employee.blank?
      		"Sem Cadastro"
		else
			self.employee.name
		end
		
	end
	def sol_employee_code
		if self.sol.employee.blank?
      		"Sem Cadastro"
		else
			self.employee.code
		end
		
	end
	def sol_employee_name
		if self.sol.employee.blank?
      		"Sem Cadastro"
		else
			self.employee.name
		end
		
	end
	def sol_description
		if self.sol.blank?
      		"Sem Cadastro"
		else
			self.sol.description
		end
		
	end
end