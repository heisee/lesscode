module ApplicationHelper
  
  def profile_menu_items
    mis=[
      {:id=>:root, :url=>:root, :name=>"Start"},
      {:id=>:profile_dir, :url=>profiles_path, :name=>"Verzeichnis"},
    ]
    if user_signed_in?
      mis<<{:id=>:profile_mgmt, :url=>profiles_path, :name=>"Profilverwaltung"}
    end
    #mis<<{:url=>edit_profile_path, :name=>"Suchen"}
    mark_current_menu_item mis
    mis
  end

  def mark_current_menu_item menu_items
    menu_items.each do |mi|
      if mi[:id]==@menu_id
        mi[:active]=true
      end
    end
  end

  def hide_if(bool)
    bool ? "display:none;" : ""
  end

  def display_if(bool)
    hide_if(!bool)
  end
end
