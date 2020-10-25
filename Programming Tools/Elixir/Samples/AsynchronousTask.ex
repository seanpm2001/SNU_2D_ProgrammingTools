task = Task.async fn -> perform_complex_action() end
other_time_consuming_action()
Task.await task
