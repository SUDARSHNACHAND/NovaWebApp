from app import app


def test_home_page():
    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200


def test_contact_api():
    client = app.test_client()

    response = client.post(
        "/api/contact",
        json={"name": "Sudarshan"}
    )

    assert response.status_code == 200

    data = response.get_json()

    assert data["success"] is True


def test_contact_api_without_name():
    client = app.test_client()

    response = client.post(
        "/api/contact",
        json={}
    )

    assert response.status_code == 400

    data = response.get_json()

    assert data["success"] is False