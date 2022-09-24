module Common
  def create_default_table
    sample_table = Table.find_by(default_data: true)
    table = sample_table.dup
    table.save
    table.update(user_id: current_user.id, default_data: false)
  end

  def create_default_works
    sample_works = Work.where(default_data: true)
    sample_works.each do |sample_work|
      work = sample_work.dup
      work.save
      work.update(user_id: current_user.id, default_data: false)
    end
  end
end
