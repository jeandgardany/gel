module ValidationsHelper
	def formatar_status(validation_id)
			if validation_id == 1
					link_to '*Pendente*', @reserve, class: "btn btn-atencao btn-xs"
				elsif validation_id == 2
					link_to '.Cancelada.', @reserve, class: "btn btn-vencido btn-xs"
				elsif validation_id == 3
					link_to 'Remarcada', @reserve, class: "btn btn-urgente btn-xs"
				else
					link_to '.Concluída.', @reserve, class: "btn btn-normal btn-xs"
			end
		
	end
end
