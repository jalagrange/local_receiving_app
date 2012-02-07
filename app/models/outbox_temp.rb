class OutboxTemp < ActiveRecord::Base

  belongs_to :outbox

  validates_presence_of :outbox
  validates_uniqueness_of :outbox_id

  def check_outbox_temps
    @sent_items = []
    Outboxtemp.all.each do |outbox_temp|
      unless outbox_temp.outbox.nil?
        sent_item = SentItem.find(outbox_temp.outbox_id) if outbox_temp.outbox.nil?
        unless ['DeliveryPending', 'DeliveryUnknown'].include?(sent_item.status)
          @sent_items << [sent_item.id, sent_item.Status]
          outbox_temp.destroy
        end
      end
    end
    self.send_status(@sent_items)
  end

  def send_status(sent_item_statuses)
    @host = 'localhost'
    @port = '3001'
  
    @path = "/receive_status"
    @body = sent_item_statuses.to_json

    binding.pry

    request = Net::HTTP::Post.new(@path, initheader = { 'Content-Type' =>'application/json' })
    request.body = @body

    response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
   
    puts "Response #{response.code} #{response.message}: #{response.body}"
  end

end
