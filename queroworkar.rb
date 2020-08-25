require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    
    /lista de empregos/
    file = File.new("QueroWorkar", "w")
    
    /url do site/    
    url = "https://queroworkar.com.br/"
    
    /pegando a url do site/
    unparsed_page = HTTParty.get(url)
    
    /acessando os atributos da pagina/
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    job_lists = parsed_page.css('article.nextajax-item')

    job_lists.each do |job_listing|
        
        job = {
            nome: job_listing.css('h2.loop-item-title').text,
            url: job_listing.css('a')[0].attributes["href"].value,
            data:job_listing.css('span.job-date-ago').text
           
        }
        puts job[:nome]

        puts job[:data]
        
        puts job[:url]
        
        file.puts(job[:nome])

        file.puts(job[:data])
        
        file.puts(job[:url])
        
         
    end
    file.close    
end

scraper
 