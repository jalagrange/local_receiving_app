class Outbox < ActiveRecord::Base
  set_table_name 'outbox'

  before_create :set_times
  before_save :set_timestamps

  has_one :outbox_temp

  after_create :create_outbox_temp

  def sent_item
    SentItem.find(self.id)
  end

  def create_temp
    self.create_outbox_temp
  end

  private
    def set_times
      if self.InsertIntoDB == Date.new(0,0,0)
        self.InsertIntoDB = Time.now
      end

      if self.SendingDateTime == Date.new(0,0,0)
        self.SendingDateTime = Time.now
      end

      if self.SendingTimeOut == Date.new(0,0,0)
        self.SendingTimeOut = Time.now
      end
    end

    def set_timestamps
      self.UpdatedInDB = Time.now
    end
end
