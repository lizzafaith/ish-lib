

module UtilsHelper
  
  
  def hr
    raw <<-EOF
    <div class="yt-horizontal-rule "><span class="first"></span><span class="second"></span><span class="third"></span></div>
EOF
  end
  
end