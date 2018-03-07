class ReservePolicy < ApplicationPolicy

	def edit?
		user.admin?		
	end

	def new?
		user.admin?		
	end

	def update?
		user.admin?		
	end

	def destroy?
		user.admin?		
	end

	def reservados?
		user.admin?		
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
