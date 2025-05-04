package responces

import "encoding/json"

type Result struct {
	Result any `json:"Result"`
}

func NewResult(data any) Result{
	return Result{data}
}

func (r Result) ToJson() ([]byte, error) {
	return json.Marshal(r)
}
