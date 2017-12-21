module MovementsHelper
		def formatar_vencimento(shelfLife)
			if shelfLife >= Date.today + 30.days
				link_to '.Normal.', @movement, class: "btn btn-normal btn-sm"
			elsif shelfLife < Date.today + 30.days and shelfLife > Date.today + 6.days
				link_to 'Atenção', @movement, class: "btn btn-atencao btn-sm"
			elsif shelfLife < Date.today
				link_to 'Vencido', @movement, class: "btn btn-vencido btn-sm"
			else
				link_to 'Urgente', @movement, class: "btn btn-urgente btn-sm"
			end
		
		end
end
