# encoding: utf-8
                 
include_controls 'oracle-java-runtime-environment-8-unix-stig-baseline' do
  control 'V-66919' do
    tag "cci": ['CCI-001162']
    tag "nist": ['SC-18', 'Rev_4']
  end

  control 'V-66923' do
    tag "cci": ['CCI-001162']
    tag "nist": ['SC-18', 'Rev_4']
  end

  control 'V-66933' do
    tag "cci": ['CCI-001162']
    tag "nist": ['SC-18', 'Rev_4']
  end

  control 'V-66935' do
    tag "cci": ['CCI-001228']
    tag "nist": ['SI-2', 'Rev_4']
  end
end
