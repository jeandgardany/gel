module ReservesHelper
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
		elsif laboratory == 'Laboratório 10'
			'Lab10'
		elsif laboratory == 'Almoxarifado'
			'Almox'
		else
			'Externo'
		end
		
	end

	def formatar_dia(day)
		if day == 'Sun'
			'Domingo'
		elsif day == 'Mon'
			'Segunda'
		elsif day == 'Tue'
			'Terça'
		elsif day == 'Wed'
			'Quarta'
		elsif day == 'Thu'
			'Quinta'
		elsif day == 'Fri'
			'Sexta'
		else
			'Sábado'
		end
		
	end

	def formatar_mes(month)
		if month == 'January'
			'Janeiro'
		elsif month == 'February'
			'Fevereiro'
		elsif month == 'March'
			'Março'
		elsif month == 'April'
			'Abril'
		elsif month == 'May'
			'Maio'
		elsif month == 'June'
			'Junho'
		elsif month == 'July'
			'Julho'
		elsif month == 'August'
			'Agosto'
		elsif month == 'September'
			'Setembro'
		elsif month == 'October'
			'Outubro'
		elsif month == 'November'
			'Novembro'
		else
			'Dezembro'
		end
		
	end
end
