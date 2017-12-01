class StockPolicy < ApplicationPolicy

	def edit?
		user.admin?		
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
