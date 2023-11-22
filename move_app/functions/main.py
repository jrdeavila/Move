# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import https_fn
from firebase_admin import initialize_app
from firebase_admin import credentials
from firebase_admin import firestore
from os.path import dirname

# Current directory path credentials
__dirname__ = dirname(__file__)
# Path to credentials
path_to_credentials = __dirname__ + "/credentials.json"
# Initialize credentials
cred = credentials.Certificate(path_to_credentials)
# Initialize app
initialize_app(cred)


@https_fn.on_request()
def on_user_created(req: https_fn.Request) -> https_fn.Response:
    return https_fn.Response("Hello world!")
