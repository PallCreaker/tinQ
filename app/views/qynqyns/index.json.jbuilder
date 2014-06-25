json.array!(@qynqyns) do |qynqyn|
  json.extract! qynqyn, :id, :count
  json.url qynqyn_url(qynqyn, format: :json)
end
