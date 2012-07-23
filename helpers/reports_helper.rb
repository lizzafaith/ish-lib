

module ReportsHelper
  
  def my_reports_path
    return '/my/reports'
  end

  def view_report_path r
    if r.class.name == String
      # this must be a stub
      '#'
    end
  end
  
  def report_path report
    if [Integer, Fixnum].include? report.class
      return "/reports/#{report}"
    end
    
    if report[:name_seo].blank?
      '/reports/' + report.id.to_s
    else
      '/reports/view/' + report.name_seo
    end
  end
  
  def global_report_path report
    if report[:name_seo].blank?
      return 'http://infiniteshelter.com/reports/' + report.id.to_s
    end
    
    'http://infiniteshelter.com/reports/view/' + report.name_seo
  end
  
  def delete_report_path report
    '/reports/' + report[:id].to_s
  end
  
  def search_reports_path
    "/reports/search"
  end
  
end
