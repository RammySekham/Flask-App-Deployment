# Entry point for the application.
from .flaskapp import bp
app = bp.init_app()

if __name__ == "__main__":
    app.run(host='0.0.0.0')
