module SearchHelper
  def searched_by_grade?(grade_id)
    if params[:search].nil?
      return false
    elsif params[:search][:grade_ids].nil?
      return false
    elsif params[:search][:grade_ids].include?(grade_id.to_s)
      return true
    end
  end
end
