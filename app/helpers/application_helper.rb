module ApplicationHelper

	def discount_to_percentage(float)
		"#{ (float * 100).to_i }%"
	end
end
