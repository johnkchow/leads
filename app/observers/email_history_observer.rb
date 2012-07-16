class EmailHistoryObserver < ActiveRecord::Observer
  observe :email_history

  def after_create(record)
  end
end
