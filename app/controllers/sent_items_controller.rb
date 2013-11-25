class SentItemsController < ApplicationController
  # GET /sentitems/get_statuses
  #
  # Given a series of identifiers for sentitems, returns a JSON dictionary where
  # the keys are the given identifiers and the values are the statuses of such
  # item, or nil if the given id doesn't correspond to any sent item
  #
  # params: item_ids -> An array of identifiers to be searched
  def get_statuses
    statuses = {}
    for id in params[:item_ids]
      sms = SentItem.find_by_ID(id)
      if sms.nil?
        statuses[id] = nil
      else
        statuses[id] = sms.status
      end
    end

    respond_to do |format|
      format.json{ render :json => statuses.to_json }
    end
  end
end
