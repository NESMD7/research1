import random
import string


class ExchangeLibrary:

    def __init__(self):
        pass

    def get_random_name(self,nameLength):
        letters = string.ascii_lowercase
        name = ''.join(random.choice(letters) for i in range(nameLength))
        return name

    def get_random_password(self,passwordLength):
        characters = string.ascii_letters + string.digits + string.punctuation
        password = ''.join(random.choice(characters) for i in range(passwordLength))
        return password
    def get_random_email(self):
       name= ''.join(random.choice(string.ascii_letters) for i in range(7))
       return (name + "@gmail.com")

