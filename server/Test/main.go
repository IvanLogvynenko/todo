package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/IvanLogvynenko/todo/server/test/structs"
)

func main() {
	stored_data := 0
	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			log.Println("Got new GET request")
			responce := structs.Responce{
				Value: "value",
				Test:  stored_data,
			}
			w.WriteHeader(http.StatusAccepted)
			json.NewEncoder(w).Encode(responce)
			return
		} else if r.Method == "POST" {
			log.Println("Got new POST request")
			var request structs.Request
			err := json.NewDecoder(r.Body).Decode(&request)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				fmt.Fprintln(w, "Corrupted json")
				return
			}
			stored_data = request.Test
			w.WriteHeader(http.StatusOK)
			responce := structs.Responce{
				Value: "value",
				Test:  stored_data,
			}
			json.NewEncoder(w).Encode(responce)
			return
		}
		log.Println("500(((")
	})
	fmt.Println("Starting server on port 8080")
	http.ListenAndServe(":8080", nil)
}
