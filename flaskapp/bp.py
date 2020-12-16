import flask

def init_ser():
    app = flask.Flask(__name__)
    return app

def init_app():
    app = init_ser()
    """Construct core Flask application with embedded Dash flaskapp."""
    with app.app_context():
        from . import views
        from .dashapp import dashboard
        app = dashboard.init_dashboard(app)
        return app
