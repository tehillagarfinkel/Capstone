require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Google Calendar API Ruby Quickstart".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = "default"
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI,
    )
  end
  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Fetch the next 10 events for the user
calendar_id = "primary"
response = service.list_events(calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: "startTime",
                               time_min: DateTime.now.rfc3339)
puts "Upcoming events:"
puts "No upcoming events found" if response.items.empty?
response.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end

body = Google::Apis::CalendarV3::FreeBusyRequest.new
body.items = [calendar_id]
body.time_min = "2019-08-18T13:00:00z"
body.time_max = "2019-08-20T21:00:00z"
pp body

service = Google::Apis::CalendarV3::CalendarService.new
service.authorization = authorize
pp service.query_freebusy(body)

# pp service.methods.sort
# pp service.execute_or_queue_command({ api_method: service.freebusy.query })

# pp service.query_freebusy({ "timeMin" => "2019-08-15T00:05:04+00:00" })

# pp service.query_freebusy({
#   timeMin: "2019-08-15T00:05:04+00:00",
#   timeMax: "2019-08-16T07:00:00+00:00",
#   timeZone: "UTC",
# # groupExpansionMax: integer,
# # calendarExpansionMax: integer,
# # items: [
# #   {
# #     id: string,
# #   },
# # ],
# })
