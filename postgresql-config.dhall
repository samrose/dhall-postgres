let ConfigType =
      { max_connections : Natural
      , shared_buffers : Text
      , effective_cache_size : Text
      , maintenance_work_mem : Text
      , checkpoint_completion_target : Double
      , wal_buffers : Text
      , default_statistics_target : Natural
      , random_page_cost : Double
      , effective_io_concurrency : Natural
      , work_mem : Text
      , min_wal_size : Text
      , max_wal_size : Text
      }

let defaultConfig : ConfigType =
      { max_connections = env:PG_MAX_CONNECTIONS ? 100
      , shared_buffers = env:PG_SHARED_BUFFERS ? "128MB"
      , effective_cache_size = env:PG_EFFECTIVE_CACHE_SIZE ? "4GB"
      , maintenance_work_mem = env:PG_MAINTENANCE_WORK_MEM ? "64MB"
      , checkpoint_completion_target = env:PG_CHECKPOINT_COMPLETION_TARGET ? 0.9
      , wal_buffers = env:PG_WAL_BUFFERS ? "16MB"
      , default_statistics_target = env:PG_DEFAULT_STATISTICS_TARGET ? 100
      , random_page_cost = env:PG_RANDOM_PAGE_COST ? 4.0
      , effective_io_concurrency = env:PG_EFFECTIVE_IO_CONCURRENCY ? 2
      , work_mem = env:PG_WORK_MEM ? "4MB"
      , min_wal_size = env:PG_MIN_WAL_SIZE ? "1GB"
      , max_wal_size = env:PG_MAX_WAL_SIZE ? "4GB"
      }

let generateConfig =
      \(config : ConfigType)
    → ''
      max_connections = ${Natural/show config.max_connections}
      shared_buffers = ${config.shared_buffers}
      effective_cache_size = ${config.effective_cache_size}
      maintenance_work_mem = ${config.maintenance_work_mem}
      checkpoint_completion_target = ${Double/show config.checkpoint_completion_target}
      wal_buffers = ${config.wal_buffers}
      default_statistics_target = ${Natural/show config.default_statistics_target}
      random_page_cost = ${Double/show config.random_page_cost}
      effective_io_concurrency = ${Natural/show config.effective_io_concurrency}
      work_mem = ${config.work_mem}
      min_wal_size = ${config.min_wal_size}
      max_wal_size = ${config.max_wal_size}
      ''

in  generateConfig defaultConfig
