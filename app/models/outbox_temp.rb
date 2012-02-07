class OutboxTemp < ActiveRecord::Base

  require 'net/http'

  belongs_to :outbox

  validates_presence_of :outbox
  validates_uniqueness_of :outbox_id

  def self.check_outbox_temps
    @sent_items = []
    OutboxTemp.all.each do |outbox_temp|
      if outbox_temp.outbox.nil?
        sent_item = SentItem.find_by_ID(outbox_temp.outbox_id)
        unless ['DeliveryPending', 'DeliveryUnknown'].include?(sent_item.Status)
          @sent_items << [sent_item.ID, sent_item.Status]
          outbox_temp.destroy
        end
      end
    end
    self.send_status(@sent_items) unless @sent_items.empty?
  end

  def self.send_status(sent_item_statuses)

	if Rails.env.production?
    @host = 'www.sms247.net'
	else
    @host = 'localhost'
	@port = 3001
	end
  
    @path = "/receive_statuses"
    @body = sent_item_statuses.to_json

    request = Net::HTTP::Post.new(@path, initheader = {'Content-Type' =>'application/json'})
    request.body = @body

    response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
   
    puts "Response #{response.code} #{response.message}: #{response.body}"

  end


end
