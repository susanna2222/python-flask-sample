# import os
from flask import Flask

app = Flask(__name__)

def wrap_html(message):
    html = """
        <html>
        <body>
            <div style='font-size:50px;'>
            <center>
                <br>
                <image height="250" width="750" src="https://pbs.twimg.com/profile_banners/1138959692/1557327842/1500x500">
                <br>
                <br>
                {0}<br>
            </center>
            </div>
        </body>
        </html>""".format(message)
    return html

@app.route('/')
def hello_world():
    message = 'Hello Docker World!'
    html = wrap_html(message)
    # target = os.environ.get('TARGET', 'World')
    # return 'Hello {}!\n'.format(target)
    return html

if __name__ == "__main__":
    #app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))
    app.run(host='0.0.0.0', port=5000)