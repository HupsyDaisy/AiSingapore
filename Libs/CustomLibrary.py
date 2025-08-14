
from robot.api.deco import keyword
import csv

class CustomLibrary:

    def __init__(self):
        pass

    @keyword("Read Jobs CSV")
    def read_jobs_csv(self, filename="datatable.csv"):
        with open(filename, newline="", encoding="utf-8") as f:
            return list(csv.DictReader(f))
        