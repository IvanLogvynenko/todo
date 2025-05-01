package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type DBRequest struct {
	Request string `json:"request"`
}

func main() {
	var db map[string]any = map[string]any{
		"name":             "Ivan",
		"age":              20,
		"IsDeepSeekBetterThanGPT": true,
	}
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodPost {
			var db_request DBRequest
			if err := json.NewDecoder(r.Body).Decode(&db_request); err != nil {
				log.Println("Error in request: ", err)
				w.WriteHeader(http.StatusBadGateway)
				json.NewEncoder(w).Encode(map[string]string{"error": err.Error()})
			}
			result, err := json.Marshal(map[string]any{"result": db[db_request.Request]})
			if err != nil {
				log.Println("Error in request: ", err)
				w.WriteHeader(http.StatusBadGateway)
				json.NewEncoder(w).Encode(map[string]string{"error": err.Error()})
			}
			w.WriteHeader(http.StatusOK)
			w.Write(result)
		} else {
			w.WriteHeader(http.StatusBadRequest)
			json.NewEncoder(w).Encode(map[string]string{"error": "Unsupported request"})
		}
	})
	http.ListenAndServe(":8080", nil)
}
