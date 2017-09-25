require('spec_helper')

  describe(Task) do
  # it("belongs to a list") do
  #   list = List.create({:name => "list"})
  #   task = Task.create({:description => "task", :list_id => list.id})
  #   expect(task.list()).to(eq(list))
  # end

  describe(".not_done") do
    it("returns the not done tasks") do
      not_done_task1 = Task.create({:description => "gotta do it", :done => false})
      not_done_task2 = Task.create({:description => "gotta do it too", :done => false})
      not_done_tasks = [not_done_task1, not_done_task2]
      done_task = Task.create({:description => "done task", :done => true})
      expect(Task.not_done()).to(eq(not_done_tasks))
    end
  end

  it("validates presence of description") do
    task = Task.new({:description => ""})
    expect(task.save()).to(eq(false))
  end

  it("ensures the length of description is at most 50 characters") do
    task = Task.new({:description => "a".*(51)})
    expect(task.save()).to(eq(false))
  end

  describe("#list") do
    it("tells which list it belongs to") do
      test_list = List.create({:name => "list"})
      test_task = Task.create({:description => "task", :list_id => test_list.id})
      expect(test_task.list()).to(eq(test_list))
    end
  end

  # describe(".all") do
  #   it("is empty at first") do
  #     expect(Task.all).to(eq([]))
  #   end
  # end
  #
  # describe("#description") do
  #   it("lets you read the description out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.description()).to(eq("learn SQL"))
  #
  #   end
  # end
  #
  # describe("#save") do
  #   it("adds a task to the array of saved tasks") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     test_task.save()
  #     expect(Task.all()).to(eq([test_task]))
  #   end
  # end
  #
  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.list_id()).to(eq(1))
  #   end
  # end
  #
  # describe("#==") do
  #   it("is the same task if it has the same description") do
  #     task1 = Task.new({:description => "learn SQL", :list_id => 1})
  #     task2 = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(task1).to(eq(task2))
  #   end
  # end
end
