task :default => [:deploy]
task :deploy do
  `bundle exec middleman build`
  `s3cmd -c ~/.s3cfg_me sync --acl-public demo/ s3://dwarfsquad.com`
end
