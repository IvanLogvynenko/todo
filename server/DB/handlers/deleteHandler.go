package handlers

import (
	"log"
	"net/http"
	"encoding/json"

	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/db"
	"github.com/IvanLogvynenko/todo/server/DB/dataTypes/responces"
)

func DeleteHandler(w http.ResponseWriter, r *http.Request, dataBase *db.DataBase) {
	var input map[string]any
	if err := json.NewDecoder(r.Body).Decode(&input); err != nil {
		log.Println("Got error: ", err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(responces.NewError("Invalid json"))
		return
	}
	defer r.Body.Close()
	path := input["path"]
	path_str, ok := path.(string)
	if !ok || path == nil {
		log.Println("Got corrupted path")
		
	}
	if err := dataBase.Delete(path_str); err != nil {
		log.Println("Error while processing request: ", err.Error())
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(err.Error())
		return
	}
	w.WriteHeader(http.StatusNoContent)
}
