# module BugHelper
#   def priority_color(priority)
#     case priority.downcase
#     when 'low'
#       '#d3f7ba' # Light green
#     when 'medium'
#       '#fff9b8' # Light yellow
#     when 'high'
#       '#ffb8b8' # Light red
#     else
#       '#ffffff' # Default color
#     end
#   end
# end
module BugHelper
  def priority_color(priority)
    case priority.downcase
    when 'low'
      { color: '#d3f7ba', icon: 'fa-check-circle' } # Light green with check mark icon
    when 'medium'
      { color: '#fff9b8', icon: 'fa-exclamation-circle' } # Light yellow with exclamation icon
    when 'high'
      { color: '#ffb8b8', icon: 'fa-times-circle' } # Light red with cross icon
    else
      { color: '#ffffff', icon: 'fa-question-circle' } # Default color with question mark icon
    end
  end
end
