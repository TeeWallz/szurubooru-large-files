#!/usr/bin/dumb-init /bin/sh
set -e
cd /opt/app

alembic upgrade head

echo "Starting szurubooru API on port ${PORT} - Running on ${THREADS} threads and maximum upload size of ${MAX_UPLOAD_FILE_SIZE_BYTES}"
exec waitress-serve-3 --port ${PORT} --max-request-body-size 5368709120 szurubooru.facade:app