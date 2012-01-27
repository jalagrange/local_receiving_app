class Outbox < ActiveRecord::Base

  set_table_name "outbox"

  has_one :outbox_temp

  after_create :create_outbox_temp

  def sent_item
    SentItem.find(self.id)
  end

  def create_temp
    self.create_outbox_temp
  end

end
