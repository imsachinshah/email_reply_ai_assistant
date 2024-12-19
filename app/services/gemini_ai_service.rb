require 'gemini-ai'

class GeminiAIService
	def initailize
		@client = Gemini.new(
				credentials: { 
					service: 'generative-language-api',
					api_key: ENV['GEMINI_API_KEY']
				},
				options: { 
					model: 'gemini-2.0-flash-exp', 
					server_sent_events: true 
				}
			)
	end

	def generate_reply(prompt)
		response = @client.generate_content(
				{
					contents: {
						role: 'user',
						parts: {
							text: "#{prompt}"
						}
					},
					server_sent_events: false
				}
			)
	end
end