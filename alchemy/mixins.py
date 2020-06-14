from utils import get_session


class CRUD:
    @property
    def session(self):
        return get_session()

    def save(self):
        if not self.id:
            self.session.add(self)
        return self.session.commit()

    def destroy(self):
        self.session.delete(self)
        return self.session.commit()
