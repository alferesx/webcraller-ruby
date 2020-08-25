
require 'nokogiri'

require 'httparty'

require 'byebug'

def scraper
    /url do site/    
    url = "https://empregos.profissionaisti.com.br/vagas/ceara/"
    
    /pegando a url do site/
        unparsed_page = HTTParty.get(url)
        
        /acessando os atributos da pagina/
        parsed_page = Nokogiri::HTML(unparsed_page)
        
        job_lists = parsed_page.css('div.job-list-content')
    
        job_lists.each do |job_listing|
            
            job = {

                url:  job_listing.css('a').map{|j|  +  j.attribute('href').to_s}
            }
            puts job[:url]
        end
end
scraper
 