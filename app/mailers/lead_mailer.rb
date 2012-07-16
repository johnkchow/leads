class LeadMailer < ActionMailer::Base
  default :from => "jwizzchow@gmail.com"

  self.raise_delivery_errors = true

  def email(email_history)
    Rails.logger.debug "Tempalte id" + email_history.template_id.to_s
    mail(:to => email_history.lead.email,
        :subject => email_history.email_subject) do |format|
      format.html { render :text => email_history.email_text }
      format.text { render :text => email_history.email_text }
    end
  end
end
