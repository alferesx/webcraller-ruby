
require 'nokogiri'

require 'httparty'

require 'byebug'

def scraper

    file = File.new("Programathor", "w")

    /url do site/    
    url = "https://programathor.com.br/jobs-city/fortaleza"
    
    /pegando a url do site/
        unparsed_page = HTTParty.get(url)
        
        /acessando os atributos da pagina/
        parsed_page = Nokogiri::HTML(unparsed_page)
        
        job_lists = parsed_page.css('div.cell-list')
    
        job_lists.each do |job_listing|
            
            job = {

                url:  job_listing.css('a').map{|j| "https://programathor.com.br" +  j.attribute('href').to_s}
            }
            puts job[:url]
            file.puts(job[:url])
        end
        file.close
end
scraper
 