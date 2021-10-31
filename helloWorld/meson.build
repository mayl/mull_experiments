project('helloWorld', 'cpp',
  version : '0.1',
  default_options : [
    'warning_level=3',
    'buildtype=debug'
    ]
  )

exe = executable('helloworld', 'helloworld.cpp',
  cpp_args: [ '-fembed-bitcode', '-g' ],
  install : true)

run_target(
  'mull',
  command: ['mull-cxx', 
    '-ide-reporter-show-killed',
    exe],
  )

test('basic', exe)
