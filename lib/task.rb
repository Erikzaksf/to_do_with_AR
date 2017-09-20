class Task
  attr_reader(:description)

  def initialize(attributes)
    @description = attributes.fetch(:description)
  end

  def ==(another_task)
    self.description().==(another_task.description())
  end
end