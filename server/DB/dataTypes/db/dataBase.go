package db

import (
	"encoding/json"
	"errors"
	"log"
	"os"
	"strings"
	"maps"
)

type DataBase struct {
	file_path string
	data      map[string]any
}

func NewDataBase(file_path string) DataBase {
	if file_path == "" {
		file_path = "data.json"
	}
	db_data := make(map[string]any)
	if _, err := os.Stat(file_path); err == nil {
		// INFO: Loading data from the file 
		data, err := os.ReadFile(file_path)
		if err != nil {
			log.Println("Error while loading db: ", err.Error())
			return DataBase{file_path, db_data}
		}
		if err = json.Unmarshal(data, &db_data); err != nil {
			log.Println("Error while parsing db: ", err.Error())
			return DataBase{file_path, db_data}
		}
	}
	return DataBase{file_path: file_path, data: db_data}
}

func (db DataBase) Get(path string) (any, error) {
	steps := strings.Split(path, "/")
	tmp_result := db.data
	for _, step := range steps[:len(steps)-1] {
		tmp, castable := tmp_result[step].(map[string]any)
		if castable {
			tmp_result = tmp
		} else {
			return "", errors.New("Value not found")
		}
	}
	return tmp_result[steps[len(steps)-1]], nil
}

func (db *DataBase) Set(path string, values map[string]any) error {
	tmp_layer := db.data
	if path != "" {
		steps := strings.Split(path, "/")
		for _, step := range steps {
			tmp, ok := tmp_layer[step].(map[string]any)
			if !ok {
				return errors.New("Path is not resolvable")
			}
			tmp_layer = tmp
		}
	}
	maps.Copy(tmp_layer, values)
	return nil
}

func (db DataBase) Delete(path string) error {
	return nil
}

func (db DataBase) Save() error {
	data, err := json.Marshal(db.data)
	if err != nil {
		return err
	}
	if err = os.WriteFile(db.file_path, data, 0777); err != nil {
		return err
	}
	return nil
}
