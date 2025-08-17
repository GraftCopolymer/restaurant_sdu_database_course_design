package logger

import (
	"go.uber.org/zap"
	"sync"
)

var once sync.Once
var instance GLogger = nil

type GLogger interface {
	Info(format string, args ...interface{})
	Warn(format string, args ...interface{})
	Error(format string, args ...interface{})
	Fatal(format string, args ...interface{})
}

type GLog struct {
	Logger *zap.Logger
	Sugar  *zap.SugaredLogger
}

func (gl GLog) Info(format string, args ...interface{}) {
	s := "ℹ️ " + format
	gl.Sugar.Infof(s, args)
}

func (gl GLog) Warn(format string, args ...interface{}) {
	s := "⚠️️ " + format
	gl.Sugar.Warnf(s, args)
}

func (gl GLog) Error(format string, args ...interface{}) {
	s := "❌️ " + format
	gl.Sugar.Errorf(s, args)
}

func (gl GLog) Fatal(format string, args ...interface{}) {
	s := "💀️ " + format
	gl.Sugar.Fatalf(s, args)
}

func Logger() GLogger {
	once.Do(func() {
		logger, err := zap.NewProduction()
		if err != nil {
			panic("Failed to init GLogger")
		}
		sugar := logger.Sugar()
		instance = GLog{
			Logger: logger,
			Sugar:  sugar,
		}
	})
	return instance
}
