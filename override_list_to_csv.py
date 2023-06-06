import sys

import topics.page_topics_override_list_pb2 as page_topics_override_list_pb2


if len(sys.argv) != 2:
    print(
        "Not the correct number of arguments passed: python3 override_list_to_csv.py override_list.pb"
    )
    exit(-1)

# Load manually curated list
override_list = page_topics_override_list_pb2.PageTopicsOverrideList()
with open(sys.argv[1], "rb") as f:
    override_list.ParseFromString(f.read())
for entry in override_list.entries:
    print(entry.domain)
