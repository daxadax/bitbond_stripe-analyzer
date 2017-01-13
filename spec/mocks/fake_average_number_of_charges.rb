class FakeAverageNumberOfCharges
  def self.called?
    @@called
  end

  def self.reset
    @@called = false
  end

  def self.perform_async(user_id) #would spawn a background job
    new(user_id).perform
  end

  def initialize(user_id)
  end

  def perform
    @@called = true
  end
end
