Rake::Task['db:migrate'].enhance do
  # Popula o banco após a migration com os dados do Yahoo.
  FetchYahooPricesJob.perform_now('PETR4.SA')
end