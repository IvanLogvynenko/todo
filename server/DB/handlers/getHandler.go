package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/db"
	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/responces"
)

func GetHandler(w http.ResponseWriter, r *http.Request, dataBase *db.DataBase) {
	query := r.URL.Query().Get("q")
	if query == "" {
		log.Println("Error in request: ", r.URL, ", q not found")
		w.WriteHeader(http.StatusBadGateway)
		json.NewEncoder(w).Encode(responces.NewError("Invalid request, q not found"))
	}
	data, err := dataBase.Get(query)
	if err != nil {
		log.Println("Error in request: ", err)
		w.WriteHeader(http.StatusBadGateway)
		json.NewEncoder(w).Encode(responces.NewError(err.Error()))
	}
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(responces.NewResult(data))
}
