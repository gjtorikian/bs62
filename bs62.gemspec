# frozen_string_literal: true

require_relative "lib/bs62/version"

Gem::Specification.new do |spec|
  spec.name = "bs62"
  spec.version = Bs62::VERSION
  spec.authors = ["Garen J. Torikian"]
  spec.email = ["gjtorikian@users.noreply.github.com"]

  spec.summary = "Fast and lightweight Base62 encoder/decoder. Written in Rust, wrapped in Ruby."
  spec.description = "Base62 encoding and decoding with a focus on simplicity and performance. Currently wraps the bs62 Rust crate."
  spec.homepage = "https://github.com/gjtorikian/bs62"
  spec.license = "MIT"

  spec.required_ruby_version = "~> 3.1"
  # https://github.com/rubygems/rubygems/pull/5852#issuecomment-1231118509
  spec.required_rubygems_version = ">= 3.3.22"

  spec.files = ["LICENSE.txt", "README.md", "Cargo.lock", "Cargo.toml"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("ext/**/*.{rs,toml,lock,rb}")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]
  spec.extensions = ["ext/bs62/extconf.rb"]

  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "funding_uri" => "https://github.com/sponsors/gjtorikian/",
    "source_code_uri" => "https://github.com/gjtorikian/bs62",
    "rubygems_mfa_required" => "true",
  }

  spec.add_dependency("rb_sys", "~> 0.9")

  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("rake-compiler", "~> 1.2")
end
