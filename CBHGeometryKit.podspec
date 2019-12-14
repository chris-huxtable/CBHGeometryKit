Pod::Spec.new do |spec|

  spec.name                   = 'CBHGeometryKit'
  spec.version                = '1.0.1'
  spec.module_name            = 'CBHGeometryKit'

  spec.summary                = 'Expanded and consistently named tools for managing Foundation geometry.'
  spec.homepage               = 'https://github.com/chris-huxtable/CBHGeometryKit'

  spec.license                = { :type => 'ISC', :file => 'LICENSE' }

  spec.author                 = { 'Chris Huxtable' => 'chris@huxtable.ca' }
  spec.social_media_url       = 'https://twitter.com/@Chris_Huxtable'

  spec.osx.deployment_target  = '10.11'

  spec.source                 = { :git => 'https://github.com/chris-huxtable/CBHGeometryKit.git', :tag => "v#{spec.version}" }

  spec.requires_arc           = true

  spec.public_header_files    = 'CBHGeometryKit/*.h'
  spec.private_header_files   = 'CBHGeometryKit/_*.h'
  spec.source_files           = 'CBHGeometryKit/*.{h,m}'

end
