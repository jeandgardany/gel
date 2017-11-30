module ReservesHelper
	def formatar_laboratory(laboratory)
		if laboratory == 'Laboratório 01'
			'Lab01'
		elsif laboratory == 'Laboratório 02'
			'Lab02'
		elsif laboratory == 'Laboratório 03'
			'Lab03'
		else
			'Sala'
		end
		
	end
end
