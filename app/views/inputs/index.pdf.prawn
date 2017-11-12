prawn_document do |pdf|
  pdf.text "Relatório de Entradas de Estoque", :size => 18,:align => :center
  pdf.move_down 20
  pdf.text  "Laboratorios         Produtos                  Validade          CV  Qtd  ValorU ValorT  Data", :size => 11,:align => :left
  pdf.table @inputs.collect{|p| [p.laboratory.name, p.product.name, p.shelfLife, p.lifeCycle, p.amount, p.unitaryValue, p.value, p.date]}
end
