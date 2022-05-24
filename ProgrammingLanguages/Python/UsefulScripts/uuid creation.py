"""
pyenv install 3.10.2
pyenv global 3.10.2

python
"""

import random

random.seed("string")
# https://stackoverflow.com/questions/41186818/how-to-generate-a-random-uuid-which-is-reproducible-with-a-seed-in-python
random = str(uuid.uuid4())

# convert letters to numbers 
# https://www.delftstack.com/howto/python/convert-letter-to-number-python/#:~:text=Use%20the%20ord%28%29%20Function%20to%20Convert%20Letters%20to,for%20x%20in%20l%3A%20n.append%28ord%28x%29%20-%2096%29%20print%28n%29
def convert_letters_to_num():
    l = "web"
    n = [ord(x) - 96 for x in l]
    print(n)


def create_unique_ids(dta):
    import uuid

    def generate_uuid():
        random = str(uuid.uuid4())
        random = random.replace("-", "")
        return random[:8]

    def check_unique_id(id_list):
        while True:
            random = generate_uuid()
            if random in id_list:
                continue
            else:
                try:
                    int(random)
                    continue
                except:
                    return random

    print("processing uuids")  # PROGRESSTRACKING:
    id_list = []
    for _ in range(len(dta)):
        id_list.append(check_unique_id(id_list))
    dta["uid"] = id_list
    print("uids are complete")  # PROGRESSTRACKING:
    return dta
