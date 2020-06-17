Pod::Spec.new do |s|
  s.name = 'ModelValidator'
  s.version = '1.0.0'
  s.summary = 'Framework for model validations'
  s.description = <<-DESC
    ModelValidator is a framework for validating models with custom validations
     errors and returning all errors at once.
  DESC
  s.homepage = 'https://github.com/railwaymen/ModelValidator'
  s.license = { :type => 'MIT', :file => "LICENSE" }
  s.author = { 'Bartłomiej Świerad' => 'bartlomiej.swierad@railwaymen.org' }
  s.source = { :git => 'https://github.com/railwaymen/ModelValidator.git', :tag => s.version.to_s }
  s.source_files = 'Sources/**/*'
  s.swift_version = '5.2'

  s.osx.deployment_target  = '10.10'
end
