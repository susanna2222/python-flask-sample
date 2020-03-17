import app
import unittest

class TestHelloWorld(unittest.TestCase):

    def setUp(self):
        self.app = app.app.test_client()
        self.app.testing = True
    
    def test_status_code(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_msg(self):
        response = self.app.get('/')
        msg = app.wrap_html('Hello Docker World!')
        self.assertEqual(response.data, msg)

if __name__ == '__main__':
    unitest.main()
