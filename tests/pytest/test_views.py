import requests


class TestViews:
    def test_index(self, client):
        response = requests.get(client.host)
        assert response.status_code == 200

    def test_blog(self, client):
        response = requests.get(f"{client.host}/blog/")
        assert response.status_code == 200

    def test_gallery(self, client):
        response = requests.get(f"{client.host}/gallery/")
        assert response.status_code == 200

    def test_about(self, client):
        response = requests.get(f"{client.host}/about/")
        assert response.status_code == 200
