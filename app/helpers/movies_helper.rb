module MoviesHelper
 def format_total_gross(movie)
   if movie.flop?
    content_tag(:strong, 'Flop!') + " it only made " + number_to_currency(movie.total_gross)
   else
     number_to_currency(movie.total_gross)
   end
 end
 
 def image_for(movie)
   if movie.image_file_name.blank?
     image_tag('placeholder.png')
   else
     image_tag(movie.image_file_name)
   end
 end

 def format_average_stars(movie)
  if movie.average_stars.nil?
    content_tag(:strong, 'No reviews')
  else
  image_tag (movie.average_stars.to_i.to_s + '_stars.png')
  end
end

 def edit_review_image
   image_tag('add2.png', style: 'border: 0', :title => 'Edit Review')
 end

 def delete_review_image
   image_tag('trash.png', style: 'border: 0', :title => 'Delete Review')
 end

end
