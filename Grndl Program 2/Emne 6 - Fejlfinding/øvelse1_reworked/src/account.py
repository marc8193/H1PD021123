import uuid

class Account:
    def __init__(self, name: str) -> None:
        self.name: str = name
        self.id: uuid.UUID = uuid.uuid1()

    def edit(self):
        pass

    def show(self):
        pass