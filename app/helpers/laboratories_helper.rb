module LaboratoriesHelper
	def formatar_laboratory(laboratory)
		if laboratory == 'Laboratório 01'
			'Lab01'
		elsif laboratory == 'Laboratório 02'
			'Lab02'
		elsif laboratory == 'Laboratório 03'
			'Lab03'
		elsif laboratory == 'Laboratório 04'
			'Lab04'
		elsif laboratory == 'Laboratório 05'
			'Lab05'
		elsif laboratory == 'Laboratório 06'
			'Lab06'
		elsif laboratory == 'Laboratório 07'
			'Lab07'
		elsif laboratory == 'Laboratório 08'
			'Lab08'
		elsif laboratory == 'Laboratório 09'
			'Lab09'
		elsif laboratory == 'Almoxarifado'
			'Almox'
		else
			'Sala'
		end
		
	end
end
