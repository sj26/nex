require "bundler/setup"
require "rack/sendfile"

$: << File.join(__dir__, "lib")
require "nex"

use Rack::Sendfile
run Nex::Web
