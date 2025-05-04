package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/db"
	"github.com/IvanLogvynenko/todo/server/DB/handlers"
)

func main() {
	dataBase := db.NewDataBase("/home/ivan/Dev/Projects/todo/server/DB/data.json")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		switch r.Method {
		case http.MethodPost:
			handlers.GetHandler(w, r, &dataBase)
		default:
			w.WriteHeader(http.StatusBadRequest)
			json.NewEncoder(w).Encode(map[string]string{"error": "Unsupported request"})
		}
	})
	log.Println("Hosting server on :8080")
	http.ListenAndServe(":8080", nil)
}
