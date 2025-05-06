package responces

import "encoding/json"

type Error struct {
	Error string `json:"error"`
}

func NewError(err_str string) Error {
	return Error{err_str}
}

func (e Error) ToJson() ([]byte, error) {
	return json.Marshal(e)
}

var UnsupportedOperation = Error{"Unsupported operation"}
