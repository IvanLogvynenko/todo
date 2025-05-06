package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/db"
	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/responces"
)

func PostHandler(w http.ResponseWriter, r *http.Request, dataBase *db.DataBase) {
	var input map[string]any
	if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
		log.Println("Got error: ", err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(responces.NewError("Invalid json"))
		return
	}
	defer r.Body.Close()
	values, ok := input["values"]
	if !ok {
		log.Println("Got request without a body")
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(responces.NewError("No value sent"))
		return
	}
	path := input["path"]
	values_map, ok := values.(map[string]any)
	if !ok {
		log.Println("Got corrupted values field!")
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(responces.NewError("Values field does not contain any KV"))
		return
	}
	if err := dataBase.Set(path.(string), values_map); err != nil {
		log.Println("Error while processing request: ", err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(err.Error())
		return
	}
	w.WriteHeader(http.StatusNoContent)
}
