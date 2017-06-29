module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << { 
      :name => 'Пользователи',
      :icon => 'users',
      :class => 'long',
      :children => [
      {:name => 'Создать',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Список',
       :controller => :users, :action => :index,
       :icon => 'users'}]}
    result << { 
      :name => 'Роли',
      :icon => 'vcard',
      :children => [
      {:name => 'Создать',
       :controller => :roles, :action => :new,
       :icon => 'plus-square'},
      {:name => 'Список',
       :controller => :roles, :action => :index,
       :icon => 'id-card'}]}
    result << { 
      :name => 'Аптеки',
      :icon => 'medkit',
      :children => [
      {:name => 'Создать',
       :controller => :pharmacies, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Список',
       :controller => :pharmacies, :action => :index,
       :icon => 'users'}]}
    result << { 
      :name => 'Информация',
      :icon => 'info-circle',
      :children => [
      {:name => 'Создать',
       :controller => :information, :action => :new,
       :icon => 'plus'},
      {:name => 'Список',
       :controller => :information, :action => :index,
       :icon => 'info'}]
    }
    result << {
      :name => 'Поиск препаратов',
      :controller => :medicines, :action => :search,
      :icon => 'search'
      }
    result << {
      :name => 'Список препаратов',
      :controller => :medicines, :action => :index,
      :icon => 'list-ol'
      }
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
