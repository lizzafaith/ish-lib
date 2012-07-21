module My::AddressbookitemsHelper
  
  def my_edit_addressbookitem_path item
    return '/my/addressbookitems/' + item['id'].to_s + '/edit'
  end
  
  def my_addressbookitem_path item
    return '/my/addressbookitems/' + item['id'].to_s
  end
  
end
