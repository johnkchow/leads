class EmailHistory < ActiveRecord::Base
  attr_accessible :lead_id, :sent_at, :template_id

  belongs_to :lead
  belongs_to :email_template, :foreign_key => :template_id
  alias :template :email_template

  after_initialize do |record|
    record.sent_at ||= Time.now
  end

  def email_text
    email_template = ERB.new(self.template.text)
    email_template.result(self.lead.get_binding)
  end

  def email_subject
    email_template = ERB.new(self.template.subject)
    email_template.result(self.lead.get_binding)
  end
end
