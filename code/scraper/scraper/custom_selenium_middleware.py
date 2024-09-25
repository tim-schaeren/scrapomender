from scrapy import signals
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from scrapy.http import HtmlResponse
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import logging
import time

class CustomSeleniumMiddleware:
    def __init__(self, driver_name, driver_executable_path, driver_arguments):
        service = Service(driver_executable_path)
        options = webdriver.ChromeOptions()
        for argument in driver_arguments:
            options.add_argument(argument)
        self.driver = webdriver.Chrome(service=service, options=options)

    @classmethod
    def from_crawler(cls, crawler):
        driver_name = crawler.settings.get('SELENIUM_DRIVER_NAME', 'chrome')
        driver_executable_path = crawler.settings.get('SELENIUM_DRIVER_EXECUTABLE_PATH')
        driver_arguments = crawler.settings.get('SELENIUM_DRIVER_ARGUMENTS', ['--headless', '--no-sandbox', '--disable-dev-shm-usage'])
        return cls(driver_name, driver_executable_path, driver_arguments)

    def process_request(self, request, spider):
        if not request.meta.get('selenium'):
            return None

        logging.info(f"Now scraping URL with Selenium: {request.url}")
        self.driver.get(request.url)

        # Click "Load More" button until it's no longer available
        while True:
            try:
                # Wait for the "Load More" button
                load_more_button = WebDriverWait(self.driver, 10).until(
                    EC.element_to_be_clickable((By.CSS_SELECTOR, 'rt-button[data-qa="load-more-btn"]'))
                )
                load_more_button.click()  # Click the button
                time.sleep(2)  # Wait for the content to load
            except Exception as e:
                # If the "Load More" button is not clickable or not present, break the loop
                break

        # Once all reviews are loaded, return the full page source
        body = str.encode(self.driver.page_source)
        return HtmlResponse(self.driver.current_url, body=body, encoding='utf-8', request=request)

    def __del__(self):
        self.driver.quit()
