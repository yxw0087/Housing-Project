json.array!(@requests) do |request|
  json.extract! request, :id, :clid, :building, :room
  json.url request_url(request, format: :json)
end
