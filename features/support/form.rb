def fill_form(form_array)
  field_map = {"Title" => "title",
               "Description" => "desc",
               "Date" => "date",
               "Time" => "usr_time"}
  form_array.each do |form_hash|
        fill_in(field_map[form_hash['KEY']] , :with => form_hash['VALUE'])
  end
end

# fill_in('title', :with => "todays to -do is")
# fill_in('desc', :with => "eiuwfyuiayfieyfiow aehuweyiuyweiuy")
# fill_in('date', :with => "01/01/2017")
# fill_in('usr_time', :with => "04:30AM")
