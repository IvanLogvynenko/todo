package responces

type Responce interface {
	ToJson() ([]byte, error) 
}
