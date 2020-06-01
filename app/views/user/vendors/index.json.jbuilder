json.array! @vendors.group_by(&:category) do |category, vendors|
    json.category category
    json.vendors do
        json.array! vendors do |vendor|
            json.extract! vendor, :id, :name, :photo_url, :city, :category
        end
    end
end
