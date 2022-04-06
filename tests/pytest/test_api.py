import requests


class TestApi:
    def test_index(self, client):
        response = requests.get(f"{client.host}/api/")
        assert response.status_code == 200

    def test_search(self, client):
        response = requests.get(f"{client.host}/api/?query=Snow-Sand")
        assert response.status_code == 200
        assert len(response.json()) == 1

    def test_pagination(self, client):
        response = requests.get(f"{client.host}/api/?start=6&limit=6")
        assert response.status_code == 200
        assert len(response.json()) == 6
