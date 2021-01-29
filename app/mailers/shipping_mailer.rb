class ShippingMailer < ApplicationMailer
  layout 'mailer'
	default from: "noreply@apptegy.com"

	def ship_order
		@emails = Recipient.where(order_id: params[:order_id]).pluck(:email)
		mail(to: @emails, subject: 'Gifts')
	end

end
