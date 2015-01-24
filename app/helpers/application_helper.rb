module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Hackatron"      
    end
  end
end
