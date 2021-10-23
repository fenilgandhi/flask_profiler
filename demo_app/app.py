from flask import Flask

def init_app():
    app = Flask(__name__)    

    @app.route("/")
    def success():
        return "App running successfully", 200
    
    return app
    
if __name__ == "__main__":
    app = init_app()
    app.run(host="0.0.0.0", debug=False)
