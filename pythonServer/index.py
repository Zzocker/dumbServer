from japronto import Application


def ping(request):
    return request.Response(text='pong')


app = Application()
app.router.add_route('/', ping)
app.run(debug=False)