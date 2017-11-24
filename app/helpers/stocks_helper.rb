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
end
