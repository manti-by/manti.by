import os

role = os.getenv("ROLE")
if role == "app":
    os.system(
        "gunicorn core.wsgi:application -w 4 -b 0.0.0.0:8080 "
        "--log-file /var/log/manti.by/wsgi.log"
    )
elif role == "celery":
    os.system(
        "celery -A core worker --concurrency=4 -n worker@manti-by "
        "-f /var/log/manti.by/worker.log"
    )
elif role == "flower":
    os.system(
        "celery flower -A core --inspect_timeout=30000 "
        "-f /var/log/mgallery/flower.log"
    )
else:
    print("OS env var ROLE -{}- not set".format(role))
    exit(-1)
