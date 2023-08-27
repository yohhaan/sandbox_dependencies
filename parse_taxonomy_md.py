import pickle
import sys

if len(sys.argv) != 3:
    raise ValueError(
        "Not the correct number of arguments passed: python3 parse_taxonomy_md.py path_to_taxonomy.md path_to_output.pickle"
    )

taxonomy = dict()
taxonomy[-2] = "Unknown"  # added as non present in taxonomy.md
with open(str(sys.argv[1]), "r") as taxo:
    # skip header and 2nd line ----
    next(taxo)
    next(taxo)
    for line in taxo:
        # split id and topic
        _, id, topic, _ = line.split("|")
        # populate dict and do some sanitizing
        taxonomy[int(id.strip())] = topic.strip()
# save to disk dict as .pickle
with open(str(sys.argv[2]), "wb") as output:
    pickle.dump(taxonomy, output, protocol=pickle.HIGHEST_PROTOCOL)
