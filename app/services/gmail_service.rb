require 'google/apis/gmail_v1'

class GmailService 

	def initialize(user_credentials)
		@service = Google::Apis::GmailV1::GmailService.new
		@service.client_options.application_name = "AI Email Reply Assistant"
		@service.authorization = user_credentials
	end

	def fetch_emails
		response = @service.list_user_messages('me', max_results: 10)
		response.messages.map do |message|
			fetch_email_details(message.id)
		end
	end

	private

	def fetch_email_details(message_id)
		message = @service.get_user_messages('me', message_id)
		payload = message.payload
		headers = payload.headers

		{
			sender: headers.find { |h| h.name == 'From' }&.value,
			recipient: headers.find { |h| h.name == 'To' }&.value,
			subject: headers.find { |h| h.name == 'Subject' }&.value,
			body: payload.parts.first.body.data,
			thread_id: message.thread_id
		}
	end
end