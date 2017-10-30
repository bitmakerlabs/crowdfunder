module ApplicationHelper

  def dollars_2dp(dollars)
   sprintf "%.2f", dollars
 end

  def dateformat(date)
    return date.localtime.strftime("%Y-%m-%d")
  end

  def project_pledges_sum(project)
    number_to_currency(project.map {|project| project.pledges.map{|p|p.dollar_amount}.sum}.sum)
  end


end
