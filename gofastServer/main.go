package main

import "github.com/valyala/fasthttp"

func ping(ctx *fasthttp.RequestCtx) {
	if string(ctx.Path()) != "/" {
		ctx.SetStatusCode(404)
		ctx.WriteString("Not Found")
		return
	}
	ctx.WriteString("pong")
}

func main() {
	fasthttp.ListenAndServe("0.0.0.0:8080", ping)
}