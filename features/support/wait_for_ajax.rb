module WaitForAjax
  def wait_for_ajax
    return unless Capybara.current_driver == Capybara.javascript_driver
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  private

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
World(WaitForAjax)
