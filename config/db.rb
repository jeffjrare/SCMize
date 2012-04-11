#DataMapper::Logger.new(STDOUT, :debug)
DataMapper::Model.raise_on_save_failure = false
DataMapper.setup(:default, 'mysql://scmize:scmize666@localhost/scmize')
DataMapper.finalize.auto_upgrade!