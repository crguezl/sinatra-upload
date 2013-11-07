require 'rubygems'
require 'sinatra'
require 'haml'
require 'pp'
 
# Handle GET-request (Show the upload form)
get "/upload?" do
  haml :upload
end      
    
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do 
  pp params
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end

