package main

import (
	"fmt"
	"net/http"
)

const (
	PORT = 8080
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("pong"))
	})
	http.ListenAndServe(fmt.Sprintf(":%d", PORT), nil)
}

// 14623.02 1000
// 15965.63 2000
// 15908.87 3000