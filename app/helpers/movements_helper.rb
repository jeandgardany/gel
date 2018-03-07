module MovementsHelper
		def formatar_vencimento(shelfLife)
			if shelfLife >= Date.today + 30.days
				link_to '.Normal.', @movement, class: "btn btn-normal btn-xs"
			elsif shelfLife < Date.today + 30.days and shelfLife > Date.today + 7.days
				link_to 'Atenção', @movement, class: "btn btn-atencao btn-xs"
			elsif shelfLife < Date.today
				link_to 'Vencido', @movement, class: "btn btn-vencido btn-xs"
			else
				link_to 'Urgente', @movement, class: "btn btn-urgente btn-xs"
			end
		
		end
end
