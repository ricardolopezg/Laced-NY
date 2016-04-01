module ApplicationHelper

  # def yeezy_nav_link
  #   content_tag :a do
  #     link_to "Yeezy", profile_path(current_user.id)      
  #   end    
  # end

  # def louis_vitton_nav_link
  #   content_tag :a do
  #     link_to "Louis Vitton", edit_profile_path(current_user.id)      
  #   end    
  # end

  # def maison_margiela_nav_link
  #   content_tag :a do
  #     link_to "Maison Margiela", claimed_jobs_path     
  #   end    
  # end  

  # def giuseppe_zanotti_nav_link
  #   content_tag :a do
  #     link_to "Giuseppe Zanotti", find_jobs_path    
  #   end    
  # end  



  
  def h1_helper(title)
    content_tag :h1, title 
  end
  def h2_helper(title)
    content_tag :h2, title 
  end
  def h3_helper(title)
    content_tag :h3, title 
  end
  def h4_helper(title)
    content_tag :h4, title 
  end
  def h5_helper(title)
    content_tag :h5, title 
  end
  def h6_helper(title)
    content_tag :h4, title 
  end
  def p_helper(body)
    content_tag :p, body 
  end
 
end
