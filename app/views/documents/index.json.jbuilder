json.array!(@documents) do |document|
  json.extract! document, :id, :docname, :deldoc, :lotnum, :custord, :docdate, :salesorder, :location_id, :product_id
  json.url document_url(document, format: :json)
end
