package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/IvanLogvynenko/todo/server/test/structs"
)

func main() {
	stored_data := 0
	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			responce := structs.Responce{
				Value: "value",
				Test:  stored_data,
			}
			w.WriteHeader(http.StatusAccepted)
			json.NewEncoder(w).Encode(responce)
		} else if r.Method == "POST" {
			var request structs.Request
			err := json.NewDecoder(r.Body).Decode(&request)
			if err != nil {
				w.WriteHeader(http.StatusBadRequest)
				fmt.Fprintln(w, "Corrupted json")
				return
			}
			w.WriteHeader(http.StatusOK)
			responce := structs.Responce{
				Value: "value",
				Test:  stored_data,
			}
			json.NewEncoder(w).Encode(responce)
		}
	})
}
