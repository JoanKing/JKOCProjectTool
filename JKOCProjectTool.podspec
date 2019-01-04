Pod::Spec.new do |s|

   s.name         = "JKOCProjectTool"
   s.version      = "0.2.9"
   s.summary      = "OCTool."
   s.description  = "这是一个很好用的OC的工具类，我会不断的更新的"

   s.homepage     = "https://github.com/JoanKing/JKOCProjectTool"
   s.license      = "Apache License 2.0"
   s.author             = { "JoanKingWC" => "2318151015@qq.com" }
   s.ios.deployment_target = "8.0"
   s.source       = { :git => "https://github.com/JoanKing/JKOCProjectTool.git", :tag => "#{s.version}" }
   #s.public_header_files = 'JKOCProjectTool/JKOCProjectTool.h'
   s.source_files = 'JKOCProjectTool/JKOCProjectTool.h'
   s.social_media_url = "https://www.jianshu.com/u/8fed18ed70c9"
   s.requires_arc = true
   s.resources = 'JKOCProjectTool/JKResource/*'
   
   s.subspec 'JKCategory' do |ss|
     ss.source_files = 'JKOCProjectTool/JKCategory/**/*'
   end

   s.subspec 'JKKit' do |ss|
     ss.dependency 'JKOCProjectTool/JKCategory'
     ss.source_files = 'JKOCProjectTool/JKKit/**/*'
     #ss.public_header_files = 'JKOCProjectTool/JKOCProjectTool.h'
   end

end

