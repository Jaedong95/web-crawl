from src import crawler 
from datetime import datetime
from dotenv import load_dotenv
import json
import logging
import os 

# 로깅 설정
logging.basicConfig(filename="selenium.log", level=logging.INFO, 
                    format="%(asctime)s - %(levelname)s - %(message)s")

with open(os.path.join('./config', 'config.json')) as f:
    config = json.load(f)

load_dotenv()
login_id = os.getenv('login_id')
login_pw = os.getenv('login_pw')

ibkcrawler = crawler.IBKCrawler(config)
ibkcrawler.set_env()
ibkcrawler.click_url()
ibkcrawler.login(login_id, login_pw)

now = datetime.now()
current_year = now.year
current_month = now.month 
current_day = now.day
print(current_month, current_day)

start_date = f"{current_month}-{current_day}"
end_date = f"{current_year}-{current_month}-{current_day}"
ibkcrawler.download_file(start_date, end_date)
ibkcrawler.quit()