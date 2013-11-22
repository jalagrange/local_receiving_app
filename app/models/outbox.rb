class Outbox < ActiveRecord::Base
  set_table_name 'outbox'
  
  def sent_item
    SentItem.find(self.id)
  end
end
