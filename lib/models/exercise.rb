class Exercise < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :muscle_group

  def add_exercise(attributes)
    Exercise.create(attributes)
  end

  def delete_exercise(name)
    Exercise.destroy_by(name: name)
  end

  def self.display_by_name
    self.all.map { |exercise| exercise.name }
  end

  def self.find_by_muscle_group(muscle_group_name)
    muscle_group = MuscleGroup.find_by_name(muscle_group_name)
    self.all.select { |exercise| exercise.muscle_group_id == muscle_group.id }
  end

  def self.find_by_equipment(equipment_name)
    equipment = Equipment.find_by_name(equipment_name)
    self.all.select { |exercise| exercise.equipment_id == equipment.id }
  end

end