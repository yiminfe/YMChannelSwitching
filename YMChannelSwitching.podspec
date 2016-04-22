Pod::Spec.new do |s|
    s.name         = 'YMChannelSwitching'
    s.version      = '1.0.2'
    s.summary      = 'Two lines of code get complex channel switching function'
    s.homepage     = 'https://github.com/iosdeveloperSVIP/YMChannelSwitching'
    s.license      = 'MIT'
    s.authors      = {'zhaoyimin' => 'iosdeveloper@vip.163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/iosdeveloperSVIP/YMChannelSwitching.git', :tag => s.version}
    s.source_files = 'YMChannelSwitching/*.{h,m}'
    s.requires_arc = true
end
