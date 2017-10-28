module ApplicationHelper

  def dollars_2dp(dollars)
    sprintf "%.2f", dollars
  end

  def dateformat(date)
    return date.localtime.strftime("%Y-%m-%d")
  end


end
