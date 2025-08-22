package constants

// TokenType token 的类型
type TokenType int
const (
	TokenTypeAccess TokenType = iota
	TokenTypeRefresh
)
